import torch
import numpy as np

def get_topic_diversity(beta, topk):
    num_topics = beta.shape[0]
    list_w = np.zeros((num_topics, topk))
    for k in range(num_topics):
        idx = beta[k,:].argsort()[-topk:][::-1]
        list_w[k,:] = idx
    n_unique = len(np.unique(list_w))
    TD = n_unique / (topk * num_topics)
    print('Topic diversity is: {}'.format(TD))

def get_document_frequency(data, wi, wj=None):
    if wj is None:
        D_wi = 0
        for l in range(len(data)):
            doc = data[l].squeeze(0)
            if len(doc) == 1:
                continue
            else:
                doc = doc.squeeze()
            if wi in doc:
                D_wi += 1
        return D_wi
    D_wj = 0
    D_wi_wj = 0
    for l in range(len(data)):
        doc = data[l].squeeze(0)
        if len(doc) == 1:
            doc = [doc.squeeze()]
        else:
            doc = doc.squeeze()
        if wj in doc:
            D_wj += 1
            if wi in doc:
                D_wi_wj += 1
    return D_wj, D_wi_wj

def get_topic_coherence(beta, data, vocab):
    D = len(data) ## number of docs...data is list of documents
    #print('D: ', D)
    TC = []
    num_topics = len(beta)
    for k in range(num_topics):
        #print('k: {}/{}'.format(k, num_topics))
        top_10 = list(beta[k].argsort()[-11:][::-1])
        top_words = [vocab[a] for a in top_10]
        TC_k = 0
        counter = 0
        for i, word in enumerate(top_10):
            # get D(w_i)
            D_wi = get_document_frequency(data, word)
            j = i + 1
            tmp = 0
            while j < len(top_10) and j > i:
                # get D(w_j) and D(w_i, w_j)
                D_wj, D_wi_wj = get_document_frequency(data, word, top_10[j])
                # get f(w_i, w_j)
                if D_wi_wj == 0:
                    f_wi_wj = -1
                else:
                    f_wi_wj = -1 + ( np.log(D_wi) + np.log(D_wj)  - 2.0 * np.log(D) ) / ( np.log(D_wi_wj) - np.log(D) )
                # update tmp:
                tmp += f_wi_wj
                j += 1
                counter += 1
            # update TC_k
            TC_k += tmp
        TC.append(TC_k)
    #print('counter: ', counter)
    #print('num topics: ', len(TC))
    TC = np.mean(TC) / counter
    print('Topic coherence is: {}'.format(TC))

def nearest_neighbors(word, embeddings, vocab):
    vectors = embeddings.data.cpu().numpy()
    index = vocab.index(word)
    print('vectors: ', vectors.shape)
    query = vectors[index]
    print('query: ', query.shape)
    ranks = vectors.dot(query).squeeze()
    denom = query.T.dot(query).squeeze()
    denom = denom * np.sum(vectors**2, 1)
    denom = np.sqrt(denom)
    ranks = ranks / denom
    mostSimilar = []
    [mostSimilar.append(idx) for idx in ranks.argsort()[::-1]]
    nearest_neighbors = mostSimilar[:20]
    nearest_neighbors = [vocab[comp] for comp in nearest_neighbors]
    return nearest_neighbors

import nltk
from nltk.collocations import *
import matplotlib.pyplot as plt
import os

def bigrams(big_document):
    ignored_words = nltk.corpus.stopwords.words('english')
    ignored_words.append('percent')
    ignored_words.append('governor')
    ignored_words.append('dont')
    # bigram_measures = nltk.collocations.BigramAssocMeasures()

    finder = BigramCollocationFinder.from_documents(big_document)
    finder.apply_word_filter(lambda w: len(w) < 3 or w.lower() in ignored_words)
    finder.apply_freq_filter(150)

    return [' '.join(x) for x in list(finder.ngram_fd.keys())]


def trigram(big_document):
    ignored_words = nltk.corpus.stopwords.words('english')
    ignored_words.append('percent')
    ignored_words.append('governor')
    ignored_words.append('dont')
    # trigram_measures = nltk.collocations.TrigramAssocMeasures()

    finder = TrigramCollocationFinder.from_documents(big_document)
    finder.apply_word_filter(lambda w: len(w) < 3 or w.lower() in ignored_words)
    finder.apply_freq_filter(100)

    return [' '.join(x) for x in list(finder.ngram_fd.keys())]


def replace_collocation(string, dict_collocation):
    for key in dict_collocation.keys():
        string = string.replace(key, dict_collocation[key])

    return string

def plot_word_cloud(text, filename='wordcloud.eps', format='eps',
                    width=1000, height=500, background_color='white', figsize=(10,6), dpi=100, bbox_inches='tight'):
    from wordcloud import WordCloud

    meeting_string = (" ").join([word for line in text for word in line])
    wordcloud = WordCloud(width=width, height=height, background_color=background_color).generate(meeting_string)
    fig = plt.figure(figsize=figsize)
    plt.subplots_adjust(left=0, right=1, top=1, bottom=0)
    plt.imshow(wordcloud)
    plt.axis("off")
    fig.tight_layout()
    plt.savefig(os.path.join(PLOT_PATH, filename), format=format, dpi=dpi, bbox_inches=bbox_inches)
