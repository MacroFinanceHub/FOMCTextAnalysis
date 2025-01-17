#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 11 13:49:50 2021

@author: olivergiesecke
"""

import os, shutil
import re
import csv
from utils import bigrams, trigram, replace_collocation
from tika import parser
import timeit
import pandas as pd
from nltk.stem import PorterStemmer
import numpy as np
import pickle
import random
from scipy import sparse
import itertools
from scipy.io import savemat, loadmat
import string
from sklearn.feature_extraction.text import CountVectorizer
from gensim.test.utils import datapath
from gensim.models.word2vec import Text8Corpus
from gensim.models.phrases import Phrases
from gensim.models.phrases import ENGLISH_CONNECTOR_WORDS

TRANSCRIPT_PATH = os.path.expanduser("~/Dropbox/MPCounterfactual/src/collection/python/output/transcript_raw_text")

BB_PATH = os.path.expanduser("~/Dropbox/MPCounterfactual/src/collection/python/output/bluebook_raw_text")
STATEMENT_PATH = os.path.expanduser("~/Dropbox/MPCounterfactual/src/derivation/python/output/statements_text_extraction.csv")
OUTPATH = os.path.expanduser("~/Dropbox/MPCounterfactual/src/etm/data")        
SPEAKER_PATH = os.path.expanduser("~/Dropbox/MPCounterfactual/src/analysis/python/output")        

MONTHS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
month_string = r"((\b"+r"\b)?(\b".join(MONTHS)+r"\b)?)"
datestring = re.compile(month_string+r"\s+\d+\–?(\d?\d?)\,\s+\d\d\d\d",re.IGNORECASE)

def generate_rawtranscripts():
    raw_doc = os.listdir(TRANSCRIPT_PATH)  # as above
    filelist = [f for f in sorted(raw_doc) if f!=".DS_Store"] # sort the pdfs in order

    newfiles = [f for f in filelist if int(f[:4]) >= 2006]


    raw_text = pd.DataFrame([])  # empty dataframe

    start = timeit.default_timer()
    for i, file in enumerate(newfiles):
        print("\n"+"*" * 80)
        print(f"Date and file {file}")
        print("*" * 80)
        #print('Document {} of {}: {}'.format(i, len(filelist), file))
        with open(os.path.join(TRANSCRIPT_PATH, file), 'r') as inf:
            parsed = inf.read()
        

        
        try:
            pre  = re.compile("Transcript\s?of\s?(?:the:?)?\s?Federal\s?Open\s?Market\s?Committee",re.IGNORECASE)
            m = re.search(pre,parsed)
            print(parsed[m.start():m.start()+90])
        
# =============================================================================
#             date = re.search(datestring,parsed[m.start():m.start()+90])[0]
#             month = re.search(month_string,date,re.IGNORECASE)[0]
#             
#             print(date)
#             print(month)
#         
#             try:
#                 day = re.search("(\–)(\d?\d?)",date,re.IGNORECASE)[2]            
#                 print(day)
#             except:
#                 pass
# =============================================================================
  
            parsed = re.split(pre,parsed)[1]    
        except:  
            try:
                pre  = re.compile("Transcript\s?of\s?(?:Telephone:?)?\s?Conference\s?Call",re.IGNORECASE)
                m = re.search(pre,parsed)
                print(parsed[m.start():m.start()+100])
            
                parsed = re.split(pre,parsed)[1] 
            except:  
                print("No split")
                parsed = parsed  
                
        interjections = re.split('\\n\s*MR. |\\n\s*MS\. |\\n\s*CHAIRMAN |\\n\s*VICE\s+CHAIRMAN |\\n\s*CHAIR\s+', parsed)  # split the entire string by the names (looking for MR, MS, Chairman or Vice Chairman)
        temp_df = pd.DataFrame(columns=['Date', 'Speaker', 'content'])  # create a temporary dataframe
        interjections = [interjection.replace('\n', ' ') for interjection in
                         interjections]  # replace \n linebreaks with spaces
        temp = [re.split('(^\S*)', interjection.lstrip()) for interjection in
                interjections]  # changed to this split because sometimes (rarely) there was not a period, either other punctuation or whitespace
        speaker = []
        content = []
        for interjection in temp:
            speaker.append(interjection[1].strip(string.punctuation))
            content.append(interjection[2])
        temp_df['Speaker'] = speaker
        temp_df['content'] = content  # save interjections
        temp_df['Date'] = file[:10]
        raw_text = pd.concat([raw_text, temp_df], axis=0)
        
    end = timeit.default_timer()   
    #raw_text.to_excel(os.path.join(CACHE_PATH,'raw_text.xlsx'))  # save as raw_text.xlsx
    print("Transcripts processed. Time: {}".format(end - start))    
    docs = raw_text.groupby('Date')['content'].sum().to_list()
    return docs,raw_text

docs,raw_text = generate_rawtranscripts()


dates =list(raw_text['Date'].unique())
date =dates[0]
for date in dates:
    data = raw_text[raw_text['Date']==date ]
    print(f"\n\n************************{date}*****************************")
    
    for idx,row in data.iterrows():
        m = re.search("policy\s+round",row["content"].lower())
        if m:
            print(idx)
            print(row["Speaker"].lower())
            print(row["content"].lower())
    






