#!/usr/bin/python3

from mrjob.job import MRJob
from mrjob.step import MRStep

class WordCount(MRJob):

    def mapper(self, _, line):
        for word in line.strip().split():
            yield word, 1

    def reducer(self, word, counts):
        yield word, sum(counts)

if __name__ == '__main__':
    WordCount.run()