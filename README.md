This repository aims to record the related work on privacy-preserving fair machine learning.

Matlab and Python implementation of privacy-preserving fair machine learning:

1. A Distributed Fair Machine Learning Framework with Private Demographic Data Protection (ICDM 2019) [[Paper]](https://arxiv.org/abs/1909.08081) 

2. Inference Attack and Defense on the Distributed Private Fair Machine Learning Framework (PPAI 2020) [[Paper]](https://www2.isye.gatech.edu/~fferdinando3/cfp/PPAI20/papers/paper_26.pdf).

3. Privacy-Preserving Fair Machine Learning Without Collecting Sensitive Demographic Data (IJCNN 2021) [[Paper]](https://www.researchgate.net/publication/354713144_Privacy-Preserving_Fair_Machine_Learning_Without_Collecting_Sensitive_Demographic_Data).

4. Privacy-Preserving Fair Machine Learning by Utilizing Proxy Data (SDM 2021) [Poster].


### Abstract
Fair machine learning has become a significant research topic with broad societal impact. However, most fair learning methods require direct access to personal demographic
data, which is increasingly restricted to use for protecting user privacy (e.g. by the EU General Data Protection Regulation). In this paper, we propose a distributed fair learning framework for protecting the privacy of demographic data. We assume this data is privately held by a third party, which can communicate with the data center (responsible for model development) without revealing the demographic information. We propose a principled approach to design fair learning methods under this framework, exemplify four methods, and show they consistently outperform their existing counterparts in both fairness and accuracy across three real-world data sets. We theoretically analyze the framework and prove it can learn models with high fairness or high accuracy, with their trade-offs balanced by a threshold variable.

### Requirements

Python 3.8.5 and Matlab R2021a.

### Cooperative Projects on Fairness Topic
1. Fair kernel regression via fair feature embedding in RKHS. accepted to International Conference on Tools with Artiﬁcial Intelligence (ICTAI), 2019
[[Paper]](https://arxiv.org/abs/1907.02242)[[Code]](https://github.com/aokray/FFE).

2. Improving Prediction Fairness via Model Ensemble. Accepted to International Conference on Tools with Artiﬁcial Intelligence (ICTAI), 2019
[[Paper]](https://ieeexplore.ieee.org/abstract/document/8995403).

3. Learning from self-reported Twitter data by FastText with sample selection bias correction. ACM Rocky Mountain Celebration of Women in Computing, 2018 [[Poster]](https://github.com/HuiHu1/Cooperative-Projects-on-Fairness-Topic/blob/main/Learning%20from%20self-reported%20Twitter%20data%20by%20FastText%20with%20sample%20selection%20bias%20correction.pdf).

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
@inproceedings{hu2020inference,
  title={Inference attack and defense on the distributed private fair learning framework},
  author={Hu, Hui and Lan, Chao},
  booktitle={The AAAI Workshop on Privacy-Preserving Artificial Intelligence},
  year={2020}
}
{
@inproceedings{hu2021privacy,
  title={Privacy-Preserving Fair Machine Learning Without Collecting Sensitive Demographic Data},
  author={Hu, Hui and Borowczak, Mike and Chen, Zhengzhang},
  booktitle={2021 International Joint Conference on Neural Networks (IJCNN)},
  pages={1--9},
  year={2021},
  organization={IEEE}
}
```
