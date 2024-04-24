# .files

This is the repository to host my automatic initial configuration to my Linux developing environment and also some other tool configuration in the `.config` directory

### Submodule

If you are authorized and wanna mess around with the submodules from this repo, you can use the following command to pull them:

```shell
# Might need for the first pull
git submodule update --init --recursive
git pull --recurse-submodules
```

### lods

This script also comes with my custom made CLI to automate some usual tasks that I have to do. To set it up properly, please visit its [github page](https://github.com/luisotaviodesimone/my-go-cli), as I already set some things up in this automatic installation script.

# TODOs

- Make rust installation script run automatically.
- Create environment variables for jenkins:
  - `JENKINS_USER_ID`  
  - `JENKINS_PASSWORD`
  - `JENKINS_URL`
