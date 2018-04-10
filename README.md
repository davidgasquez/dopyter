<p align="center"><img width=35% src="https://user-images.githubusercontent.com/1682202/36675528-8a1d3fb0-1b09-11e8-900f-074d81fd6ae7.png"></p>

&nbsp;&nbsp;&nbsp;&nbsp;

[![Build Status](https://travis-ci.org/davidgasquez/dopyter.svg?branch=master)](https://travis-ci.org/davidgasquez/dopyter)

Opinionated mix of Docker + Python + [Jupyter][jupyter] for Data Analysis. This
project is inspired by the awesome [Jupyter Docker Stacks][docker-stacks].

## Quick Start

Dopyter is only a Docker container with Jupyter, and a variety
of Python 3 [packages][packages] such as Numpy, Pandas, or Scikit Learn, in a
ready-to-use form. To use Dopyter, you'll need to install Docker on your
machine.

To launch an instance of Dopyter in the your current folder, run:

```bash
docker run -p 8888:8888 -it --rm davidgasquez/dopyter
```

You can also pass an `.env` file like this:

```bash
docker run -p 8888:8888 -it --env-file=.env --rm davidgasquez/dopyter
```

This will spawn Jupyter Lab in [`localhost:8888`][lh]. You can now start
analyzing, plotting and predicting your fancy data.

[jupyter]: http://jupyter.org/
[docker-stacks]: https://github.com/jupyter/docker-stacks
[lh]: http://localhost:8888/
[packages]: requirements.yml

## License

MIT © David Gasquez
