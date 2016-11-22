# Dopyter

Opinionated mix of Docker + Python + Jupyter for Data Analysis.

## Quick Start

If you're familiar with Docker and have it configured you can run:

```bash
docker run -p 8888:8888 -v $PWD:/work -it --rm davidgasquez/dopyter
```

This will spawn Jupyter in `localhost:8888`.
