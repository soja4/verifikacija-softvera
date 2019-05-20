#!/usr/bin/python
# -*- coding: utf-8 -*-
import numpy as np
import pydotplus as pydot
from IPython.display import Image, display
import os
import DumpTreeStream


def makeTreeGraph(symPath):
    treeData = DumpTreeStream.getTreeStream(symPath)

    # data = np.array([(0, ''), (1, '1'), (2, '01'), (3, '001'), (4, '0001'), (5, '00001'), (6, '00000')])

    data = np.array(treeData)
    paths = data[:, 1]
    print(paths)
    n = len(paths)
    d = [len(x) for x in paths]
    print(d, n)

    # jedinice = np.count_nonzero(1 for x in paths if '1' in x)

    jedinice = np.sum(1 for x in paths if '1' in x)


    maks1 = max(d)

    maks1 = maks1 + 1
    G = pydot.Dot(graph_type='graph')
    for i in range(jedinice):
        node = pydot.Node(i, style='filled', fillcolor='green')
        G.add_node(node)

    for i in range(jedinice):
        edge = pydot.Edge(i, i + 1, label='F')
        G.add_edge(edge)
    i = -1
    for path in paths[1:]:
        i = i + 1
        for p in path:
            if p == '1':
                node = pydot.Node(maks1, style='filled', fillcolor='red'
                                  , label=path)
                G.add_node(node)
                edge = pydot.Edge(i, maks1, label='T')
                G.add_edge(edge)
                maks1 = maks1 + 1

    im = Image(G.create_png())
    display(im)


def main():
    from optparse import OptionParser
    op = \
        OptionParser('usage: %prog [options] <tree-stream-path> <output-path>'
                     )
    op.add_option(
        '',
        '--count',
        dest='count',
        type=int,
        default=-1,
        help='number of distinct paths to draw',
        )
    op.add_option('', '--shuffle', dest='shuffle', action='store_true',
                  default=False)
    (opts, args) = op.parse_args()

    (symPath) = args
    makeTreeGraph(symPath)


if __name__ == '__main__':
    try:
        main()
    except:
        import sys
        import traceback
        traceback.print_exc(file=sys.__stdout__)
        sys.__stdout__.flush()

			
