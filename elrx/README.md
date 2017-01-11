#Quick info

If I want to use just Elixir without the Phoenix framework, then I run something like:
```bash
sudo docker run --name elixir -dt elixir
```
Perhaps adding some data volume and database linked. 

But if I know before start that I will need Phoenix, then I just build this dockerfile and run the container like above...

As we are running a phoenix container we need to provide node.js to be able to use those greats assets management.

But I hate to install several services in one container. I like my containers very efemerals. So if I need postgres, I'll make a container for elixir and one for postgres and connect them with link. Now I need node? So I just create the node container and use link.

Sadly, is not that simple to do it, I need to teach phoenix to find where node is etc. As I could not find anywhere this architecture implemented (other people seems to like a lot of put everything in only one container) I will need to learn how I can do it...

So I will update here everytime some news come up

#Changes in plan

Well, I've tried to run node in separate container. The npm install works, but when I go back to phoenix container and call phoenix.server it throws an error because the whatcher can't run because node is not present. The message continues and tell me that I need to install node and run npm install. But this is something I already did and worked. So, I guess that if brunch is used the node dependency is deeper than I thougth. 

In future I'll go back to this issue. For now, everything in the container =(
