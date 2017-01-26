# Dopyter

Opinionated mix of Docker + Python + [Jupyter][jupyter] for Data Analysis. This
project is inspired by the awesome [Jupyter Docker Stacks][docker-stacks].

## Quick Start

Dopyter is only a docker container which contains Jupyter, and a variety
of Python 3 [packages][packages] such as numpy, pandas, or scikit-learn, in a
ready-to-use form. To use Dopyter you'll need to install Docker on your machine.

To launch an instance of Dopyter in the your current folder, run
`docker-compose up` or:

```bash
docker run -p 8888:8888 -v $PWD:/work -it --rm davidgasquez/dopyter
```

This will spawn a Jupyter Notebook in [`localhost:8888`][lh].You can now start
analyzing, plotting and predicting your fancy data.

[jupyter]: http://jupyter.org/
[docker-stacks]: https://github.com/jupyter/docker-stacks
[lh]: http://localhost:8888/
[packages]: requirements.yml

## License

MIT © David Gasquez
