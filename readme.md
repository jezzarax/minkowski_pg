### Purpose

A docker-based jupyter environment to make [MinkowskiEngine](https://github.com/NVIDIA/MinkowskiEngine) available on macos and everywhere else where docker runs.

### Running

No docker image is built, it's on you to do it

```
git clone ...
cd minkowski_pg
docker build -t miengine ./
docker run --rm -ti -p 5003:5003 miengine
```

#### Persisting the code

Map `/opt/jupyternotebooks` which is the jupyter home inside of the image to any folder on your machine.
