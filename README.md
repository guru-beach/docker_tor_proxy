# docker_tor_proxy
Docker based setup for Tor/Privoxy based on Jessie Frazelle's work


This is a wrapper around work Jessie Frazelle has already done and documented.  You can find more in depth information on her blog:
https://blog.jessfraz.com/post/tor-socks-proxy-and-privoxy-containers/

A word of warning.   Jess talks about using a dockerized version of Firefox or any browser for that matter.   This is actually a really good idea, but not something I have working yet.   This does mean that your browser could give away some key details about you.   Make sure to use Private/Incognito mode AT A MINIMUM!


## Setup

This setup requires you have a working copy of Docker on your system.  It also assumes you're running this on a Mac, which is probably false in some cases, so you'll have to adjust according if using Linux or Windows (but you're not using Windows right???)

### Clone this repo

This assumes you know how to use Git and Github in general.  That might also be a bad assumption, so if you don't know how, click the "Clone or Download" button and download the zip file of this repository.

If you downloaded a zip, unzip it somewhere useful.

###  Install Docker 
If you're using a Mac download Docker for Mac https://store.docker.com/editions/community/docker-ce-desktop-mac
 
Follow the install instructions.  If you're able to install, start the app and test it by opening a terminal window (I use iTerm2 (http://iterm2.com/), it's WAY better than terminal)

If you're a Linux user, hopefully you can figure out how to install Docker.  If you're a Linux user that can't figure that out.   Go back to Windows (I'm sorta kidding, but not really).

### Run setup.sh

Open your favorite handy-dandy terminal and change to the directory you checked out or unzipped.  

```
bash setup.sh
```

This will build both of the docker containers you need (Tor-Proxy and Privoxy) and install them on your system.   


### Start the proxies

Because I don't like mucking with other peoples bash profiles, I've included the bashrc_functions.sh file.  

You can either source this, or just add the functions to your existing .bashrc

```
source bashrc_functions.sh
start_proxies
```

### Configure your browser

Set your brower proxies to localhost:8118.  In firefox, I make this true for all proxy settings.   

### Verify connectivity

https://check.torproject.org/api/ip

You should see something like
{"IsTor":true,"IP":"111.222.333.444"}

The "IsTor":true is the most important part.   

You can also just use the normal page: https://check.torproject.org/

### Start surfing in privacy

This isn't entirely true.   There are rumors the .gov is running a bunch of Tor nodes to help gather as much data as they can about people.  This is probably true, but at a minimum, you're not advertising your surfing behaviors to your ISP.   

One other layer I like to use is to use a VPN.  I use VyprVPN and then run Tor/Privoxy through that.  I'm not a hacker or a criminal.  I just work in advertising and know how much data we collect on people.   And I know how that data is used.   

Happy surfing!
