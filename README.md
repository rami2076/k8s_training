# k8s_training

k8sの練習を行うプロジェクトです．

# 使用するTool

minikubeを使います．

- https://kubernetes.io/ja/docs/setup/learning-environment/minikube/
- https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fbinary+download

# 使用するMarkup language

ReStructuredText

- REF
    - https://www.sphinx-doc.org/ja/master/usage/restructuredtext/basics.html
    - https://youtrack.jetbrains.com/articles/SUPPORT-A-522/How-to-open-preview-.rst-file-in-IntelliJ-IDEA
    - https://quick-restructuredtext.readthedocs.io/
    - https://docutils.sphinx-users.jp/docutils/docs/ref/rst/restructuredtext.html
    - https://zenn.dev/koin3z/articles/f9a7fa1048a8b7
    - https://documatt.com/restructuredtext-reference/element/code-block.html
    - https://zenn.dev/y_mrok/books/sphinx-no-tsukaikata/viewer/chapter18
- 理由
    - 複雑な票を作成できるから

# kt_sample

## init

https://spring.pleiades.io/guides/tutorials/spring-boot-kotlin

```bash
curl https://start.spring.io/starter.zip \
  -d language=kotlin -d type=gradle-project-kotlin \
  -d dependencies=web,devtools \
  -d packageName=com.example.kt_sample \
  -d name=kt_sample \
  -o kt_sample.zip
unzip kt_sample.zip
rm kt_sample.zip
```

## 