# Getting started

There are six things a newcomer needs to get started:

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Walkthrough](#walkthrough)
  - [Python](#python)
  - [Jupyter](#jupyter) or [Jupyter using Docker](#to-run-jupyter-using-docker) or [Jupyter with one click](#to-run-jupyter-with-one-click)
  - [Data science libraries](#data-science-libraries)
  - [`serenata-toolbox` library](#serenata-toolbox-library)
  - [`git`](#git)
  - [A free or paid GitHub account](#a-free-or-paid-github-account)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

We will help you get things ready to go.

## Walkthrough

### Python

Python does not come prepackaged with Windows. If you use MacOS or Linux, you already have Python installed, but it is possibly version 2.7, which is about to be obsolete.

Either way, we will need to install Python 3.6 or above to work with the scripts developed by Senerata de Amor. So let's get it done:

1. Go to [Python's official download page](https://www.python.org/downloads/)
2. Download the latest release for your OS (Windows, MacOS, Linux)
3. Double-click to start installing
4. During installation, ensure that the "Install launcher for all users (recommended)" and the "Add Python x.x to PATH" checkboxes at the bottom are checked
5. Click "Install Now" button
6. When asked "Do you want the allow the following program to make changes to this computer?", choose "Yes"
7. A setup pop-up will appear. Let the progress bar reach the end, and the installation is complete
8. To check if it is OK, go to your console (Terminal app on MacOS and Linux, and Command Prompt on Windows) and type `python --version` (if you already have Python 2.7 installed, the command you must type is `python3 --version`). It will return the version of Python 3.x you have just installed. For example, `Python 3.6.5`. It means the installation is successfully done.

If you find any problem during the installation process, just [write a message](https://github.com/okfn-brasil/notebooks/issues/new) and we will try to assist you.

### Jupyter

Python comes with `pip`, a package management system we use a lot when we need to download and install Python libraries and other packages.

`pip` is what you will use to install Jupyter Notebook, an application designed to create and share scripts and data analysis. It allows you to write a line of code and get the result instantly. That is why Jupyter Notebook is the weapon of choice of data analists and scientists. By the way, check Project Jupyter here: [http://jupyter.org/index.html](http://jupyter.org/index.html).

To get Jupyter Notebook on your machine, open the Terminal (MacOS and Linux) or Command Prompt (Windows), and run:

`python -m pip install jupyter`

Be aware: if you have also Python 2.7, you must choose the version of Python Jupyter Notebook will be running on. So instead of the line above, run:

`python3 -m pip install jupyter`

After the installation process, run:

`jupyter notebook`

Your browser will open on http://127.0.0.1:8888 or http://localhost:8888/, which is the default URL for Jupyter Notebook dashboard.

At the same time, your Terminal/Command Prompt window will show a message like this:

```
$ jupyter notebook
[I 08:58:24.417 NotebookApp] Serving notebooks from local directory: /Users/rodolfo
[I 08:58:24.417 NotebookApp] 0 active kernels
[I 08:58:24.417 NotebookApp] The Jupyter Notebook is running at: http://localhost:8888/
[I 08:58:24.417 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
```

**Do not close the Terminal/Command Prompt window while using Jupyter Notebook. Keep it open and running all the time or it will finish Jupyter Notebook.** When you are done with your work on Jupyter Notebook, save it (with `.ipynb` by the end of the file name), close the browser tab, go to the Terminal/Command Prompt window and hit `Cmd+C` (MacOS and Linux) or `Ctrl+C` (Windows).

Jupyter Notebook is well documented here: [https://jupyter.readthedocs.io/en/latest/index.html](https://jupyter.readthedocs.io/en/latest/index.html). But if you still struggle to get it running, [drop a message](https://github.com/okfn-brasil/notebooks/issues/new) and we will help you.

### To run Jupyter using Docker

* Download the datasets using [serenata's toolbox](#serenata-toolbox-library) into the `data/` folder,

* Then you can run with a pre-built docker image with the following:

  ```console
  docker pull okbr/serenata-notebooks
  ```
  ```console
  docker run --rm -i -t -p 8888:8888 -v "$PWD/notebooks":/notebooks -v "$PWD/data":/notebooks/data  okbr/serenata-notebooks  /bin/bash -c "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root"
  ```

* Or build you own image with the following:

  ```console
  git clone https://github.com/okfn-brasil/notebooks.git
  ```
  ```console
  cd notebooks
  docker build -t okbr/serenata-notebooks .
  ```
  ```console
  docker run --rm -i -t -p 8888:8888 -v "$PWD/notebooks":/notebooks -v "$PWD/data":/notebooks/data  okbr/serenata-notebooks  /bin/bash -c "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root"
  ```

* After that, open up your browser and access `http://localhost:8888` to interact with the notebooks here.

### To run Jupyter using Docker Compose

* Download the datasets using [serenata's toolbox](#serenata-toolbox-library) into the `data/` folder,

* Install [docker-compose](https://docs.docker.com/compose/install/)

* Then run jupyter with the following:

  ```console
  git clone https://github.com/okfn-brasil/notebooks.git
  ```
  ```console
  cd notebooks
  docker-compose up -d
  ```

* Get the jupyter token with:

  ```console
  docker-compose logs
  ```

### To run Jupyter with one click

You could start a new Jupyter instance with one click using [binder](https://mybinder.org).

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/okfn-brasil/notebooks/master?filepath=notebooks)

### Data science libraries

Python core functions are awesome but limited. To perform data analyses smoothly you need some third-party libraries specially developed for data science.

The most common ones we use are listed below as well as the line you must run to install them. If the line does not work, try adding `python -m` or `python3 -m` before it.

+ Pandas: `$ pip install -U pandas`
+ Numpy: `$ pip install -U numpy`
+ Matplotlib: `pip install matplotlib`

According to the complexity of your work you may find the need of using other libraries. To install them, google the correct `pip` name and run:

`$ pip install -U <name of library>`

If you find yourself in trouble, just [leave a message](https://github.com/okfn-brasil/notebooks/issues/new) and we will assist you as soon as possible.

### `serenata-toolbox` library

Serenata team has developed its own Python libraries to execute some standard processes, such as downloading and cleaning datasets used in analyses. They can be found here: [https://github.com/okfn-brasil/serenata-toolbox](https://github.com/okfn-brasil/serenata-toolbox).

To install them, run:

`$ pip install -U serenata-toolbox`

(If it does not work, try adding `python -m` or `python3 -m` in the beggining of the line.)

[Write a message](https://github.com/okfn-brasil/notebooks/issues/new) if you encounter any error during installation.

### `git`

`git` is a version-control system. In other words, it is the tool you need to share your work with us.

As this system allows its users to track changes in files, we use `git` to have multiple versions of the same file and "copy and paste" the pieces we want to keep on its final version.

With `git` you send us your work, we adjust what is necessary and send it back to you -- without compromising your original work.

To install `git`, go to [git-scm.com/downloads](https://git-scm.com/downloads) and choose the one suitable for your operating system.

### A free or paid GitHub account

At last, you need a GitHub account to share your work with us. Follow these steps:

1. Go to [github.com](https://github.com/) and create am account.
2. Come to [Serenata's Notebook GitHub repository](https://github.com/okfn-brasil/notebooks) and click "Fork" on the top right of the page.
3. Open your Terminal/Command Prompt.
4. Choose a folder in your computer and run `mkdir notebooks`
5. Run `cd notebooks`
6. Run `git clone https://github.com/<your-name-on-github>/notebooks.git` to download the repository to your machine.

Now you have everything you need to get started. Soon we will write instructions on how to effectively share your work with us, get feedback, cooment changes, collaborate with other users and so on.
