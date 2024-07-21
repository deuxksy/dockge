# jenkins-ci

```groovy
println("plugins:")
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("- artifactId: ${plugin.getShortName()}\n  source:\n    version: ${plugin.getVersion()}")
}
```
