Matlab implementation of "A Distributed Fair Machine Learning Framework with Private Demographic Data Protection" (ICDM 2019) [[paper]](https://arxiv.org/abs/1909.08081) and
"Inference Attack and Defense on the Distributed Private Fair Machine Learning Framework" (PPAI 2019) [[paper](https://www2.isye.gatech.edu/~fferdinando3/cfp/PPAI20/papers/paper_26.pdf).


### Abstract
Fair machine learning has become a significant research topic with broad societal impact. However, most fair learning methods require direct access to personal demographic
data, which is increasingly restricted to use for protecting user privacy (e.g. by the EU General Data Protection Regulation). In this paper, we propose a distributed fair learning framework for protecting the privacy of demographic data. We assume this data is privately held by a third party, which can communicate with the data center (responsible for model development) without revealing the demographic information. We propose a principled approach to design fair learning methods under this framework, exemplify four methods and show they consistently outperform their existing counterparts in both fairness and accuracy across three real-world data sets. We theoretically analyze the framework, and prove it can learn models with high fairness or high accuracy, with their trade-offs balanced by a threshold variable.

### Citation

```
{
@inproceedings{hu2019distributed,
  title={A distributed fair machine learning framework with private demographic data protection},
  author={Hu, Hui and Liu, Yijun and Wang, Zhen and Lan, Chao},
  booktitle={2019 IEEE International Conference on Data Mining (ICDM)},
  pages={1102--1107},
  year={2019},
  organization={IEEE}
}
```
