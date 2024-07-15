# jenkins-ci

[plugin 설치 내역 확인 하기](https://knou-ci.justten.io/script)

```groovy
println("plugins:")
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("- artifactId: ${plugin.getShortName()}\n  source:\n    version: ${plugin.getVersion()}")
}
```
