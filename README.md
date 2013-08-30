## Purpose

Builds an image with with ready to go for your custom apps

```
> docker build . -t stocks29/carton
```

Now you get an image called stocks29/carton with plenv setup with the latest perl and carton already installed

## Build your Application

You can now use the stocks29/carton image to build your applications container.

Create your application's Dockerfile

```
# Dockerfile in your web apps dir
FROM stocks29/carton

# Bundle app source
ADD . /src

RUN cd /src; /root/.plenv/shims/carton install --deployment

EXPOSE  5000
WORKDIR /src
CMD ["/root/.plenv/shims/carton", "exec", "starman", "-Ilib", "--preload-app", "app.psgi"]
```

Then build your image
```
> docker build -t myuser/myapp:1.0 .
```

Lastly, run it
```
> docker run -d -p 80:5000 myuser/myapp:1.0
```

## Author

Bob Stockdale
