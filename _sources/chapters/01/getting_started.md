---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Getting Started

Welcome to the exciting world of programming!

## Objectives

- Understand what a computer is.
- Understand what a program is.
- Understand what a programming language is.
- Learn about the features of Python.
- Begin using Python.

## Computers

A modern computer can be defined as "a machine that **stores**, **manipulates**, and **processes** information under the control of a **changeable program**, while also interacting with the external world through input and output."

- **Manipulation** means transforming information into new, useful forms, and then storing, outputting, or displaying it for interpretation.
- **Examples**:
  - Find students with the highest and lowest GPA.
  - Identify patients whose hospital stay exceeded 15 days.
  - Sort the monthly sales of a bakery to determine which months had the highest sales.
  - Classify a cancer case as benign or malignant based on diagnostic measurements.
  - Predict house prices based on historical data.

## What is a Program?

A computer program is a detailed, step-by-step set of instructions that precisely tells a computer what to do.

- If we **change** the program, the computer performs a different sequence of actions, resulting in the execution of a distinct task.
- A program is composed of a few fundamental operations that its reader already comprehends. By utilizing these basic operations, you can introduce new operations to a computer by defining them in relation to the foundational ones.
  - **Example**: Computers comprehend basic mathematical operators such as addition and division. You can instruct the computer to calculate the average using these operators by guiding it to add all numbers in a sequence and then divide by the sequence size.
  - **Example**: Subsequently, you can integrate the newly created average operation with other functions to generate additional operations. This process is akin to building with LEGOs, where basic bricks are combined to create more complex structures.

Defining new operations and combining them to perform useful tasks is the heart and soul of programming.

Every computer is essentially a machine designed to execute (carry out) programs. Software (programs) governs the hardware (physical machines), and it is the software that dictates the capabilities of any computer. Without software, computers would be nothing more than costly paperweights. The act of crafting software is referred to as **programming**.

## What is a Programming Language?

You can express directions to the nearest bus station in many different languages, such as English, Spanish, or Hindi. However, natural languages are fraught with ambiguity and imprecision.

**English example**: "I saw a man on a hill with a telescope."

- There is a man on a hill, and I am watching him with my telescope.
- There is a man on a hill, who I am seeing, and he has a telescope.
- There is a man, and he is on a hill that also has a telescope on it.
- I am on a hill, and I saw a man using a telescope.
- There is a man on a hill, and I am sawing him with a telescope.
- source: <https://www.quora.com/What-are-some-examples-of-ambiguous-sentences>

Computer scientists have resolved this issue by devising notations for expressing computations precisely and without ambiguity. These special notations are called **programming languages**.

Similar to natural languages, numerous programming languages exist. However, they all serve as instructions that machines can comprehend and can exhibit variations in appearance. For instance:

- In Python: `3 + 4` signifies the addition of three and four.
- In Scheme: `(+ 3 4)` represents the same operation. While both convey the same concept, they are visually distinct.

Every programming language includes methods for:

- Crafting mathematical expressions
- Iterating instructions multiple times
- Making selections among instructions based on available information

Programming languages take a **high-level** language, comprising human-readable expressions like `c = a + b`, and translate it into machine language that the computer can execute. This translation can occur through **compilation** or **interpretation**, depending on the language and its implementation.

A machine language consists of precise instructions for CPUs. For example, adding two numbers might involve the following CPU instructions:

```text
load the number from memory location 2001 into the CPU
load the number from memory location 2002 into the CPU
add the two numbers in the CPU
store the result into location 2003
```

- **Compilers** transform programs written in a high-level language into the machine language of a specific computer. Some languages, like Python, use a hybrid approach where the source code is first compiled into an intermediate representation (bytecode) and then interpreted by a virtual machine.
- **Interpreters** simulate a computer that understands a high-level language.
  - The source program is not translated into machine language all at once.
  - An interpreter analyzes and executes the source code instruction by instruction (line by line).

### Compiling vs. Interpreting

- Once a program has been compiled, it can be executed repeatedly without requiring the source code or compiler. If it is interpreted, both the source code and the interpreter are necessary each time the program runs.
- Compiled programs generally run faster since the translation of the source code occurs only once.
- Interpreted languages offer a more flexible programming environment as they can be developed and run interactively.
- Interpreted programs are more portable, provided that an interpreter for the target platform is available. The executable code produced by a compiler for a specific architecture won't run on a different architecture without recompilation.

It's important to note that while programming languages are designed for precision, logical errors can still occur, leading to unexpected program behavior. These are commonly referred to as **bugs**!

## Features of Python

Python is a popular choice for beginners and experienced developers alike due to its clear syntax and powerful capabilities.

Python is:

- **High-level language**
- **Interpreted language**: Python employs a hybrid compiling/interpreting process. The Python source code in the module file (the `.py` file) is compiled into more primitive instructions known as `byte code`. This byte code (the `.pyc` file) is subsequently interpreted. The `.pyc` file is optional and is generated when the program is run or imported. If the `.pyc` file is deleted or not present, Python will recompile the source code into bytecode.
- **Object-oriented language**: Python is also a multi-paradigm language, supporting procedural and functional programming styles.
- **Dynamically typed**: Variables do not need explicit type declarations.
- **Garbage-collected**: Python automatically manages memory allocation and deallocation.
- **Easy to learn**: Python's syntax is simple, making it easy to understand and read.
- **Versatile**: Python can be used for various purposes such as web development, machine learning, and cloud administration.
- **Popular**: It boasts numerous third-party packages that extend its functionality, particularly in the realm of data science.

## Using Python

There are four ways to use Python. We will demonstrate how to utilize all four methods, with a primary focus on Jupyter Notebook and Microsoft Visual Studio Code.

### A Basic Python Program

Please install [Anaconda Python Distribution](https://www.anaconda.com/products/distribution).

```python
def add(x: int, y: int) -> int:
    return x + y

def main():
    x = 1
    y = 2
    result = add(x, y)
    output_string = f'The output of add({x}, {y}) is {result}.'
    print(output_string)

if __name__ == '__main__':
    main()
```

By convention, the statements of a program are often placed in a function called `main()`.

### Ways to Use Python

1. Command Line: For running quick scripts and executing programs directly.
2. IDLE: A simple integrated development environment (IDE) often used by beginners.
3. Jupyter Notebook: An interactive environment ideal for data analysis, visualization, and sharing code.
4. Microsoft Visual Studio Code: A powerful and versatile code editor with excellent extensions for Python development.
    1. Python (official extension for Python development)
    2. Pylance (for better IntelliSense and type checking)
    3. Jupyter (for running Jupyter Notebooks in VS Code)
    4. File Utils
    5. Markdown All in One
    6. SQLite Viewer
5. Docker + Anaconda: For creating consistent and isolated development environments.

### Setting up a Local Development Environment (Docker + Anaconda)

We will be setting up a local development environment using Docker and Anaconda. This will ensure that everything I do, you can reproduce on your machine without version conflicts.

Linux is an essential skill for data engineering, data science, and MLOps. Most production systems, cloud services, and orchestration platforms run on Linux, and many tools are designed and tested primarily for Linux environments. We are using containers so that everyone becomes familiar with Linux commands and workflows while working in a consistent, reproducible setup.

#### 1. Create the project folder

We will keep everything in one place and use a shared folder that maps to your host.

```bash
mkdir anaconda-ubuntu
cd anaconda-ubuntu
mkdir shared_folder
```

#### 2. Add the Dockerfile and docker-compose.yml

Create two files in the anaconda-ubuntu folder with the following contents. Each line includes a brief explanation.

Dockerfile:

```Dockerfile
FROM ubuntu:24.04                                                  # Use Ubuntu 24.04 LTS (Noble Numbat) as the base image

ENV DEBIAN_FRONTEND=noninteractive                                 # Prevent interactive prompts during package installs

RUN apt-get update && \                                            # Update apt package index
    apt-get install -y --no-install-recommends \                   # Install packages without optional recommendations
        wget \                                                     # Downloader to fetch the Anaconda installer
        curl \                                                     # Alternative downloader for future needs
        ca-certificates \                                          # SSL certificates for secure HTTPS downloads
        zip \                                                      # Zip utility
        less \                                                     # Pager for viewing files
        vim \                                                      # Text editor
        bzip2 \                                                    # Compression utility used by some archives
    && rm -rf /var/lib/apt/lists/*                                 # Clean apt cache to reduce final image size

RUN wget -q \                                                      # Quiet download to reduce log noise
    https://repo.anaconda.com/archive/Anaconda3-2025.06-1-Linux-x86_64.sh \  # Requested Anaconda installer URL
    -O /tmp/anaconda.sh                                            # Save the installer to /tmp/anaconda.sh
    && bash /tmp/anaconda.sh -b -p /root/anaconda3                 # Run installer silently (-b), install to /root/anaconda3
    && rm -f /tmp/anaconda.sh                                      # Remove the installer to keep the image small

ENV PATH="/root/anaconda3/bin:${PATH}"                             # Add conda and python to PATH for all subsequent commands

RUN conda init bash                                                # Initialize conda for bash shells (adds shell hook configuration)

SHELL ["/bin/bash", "-c"]                                          # Use bash for subsequent RUN/CMD so conda initialization works

RUN mkdir -p /shared_folder                                        # Ensure the shared working directory exists inside the image
WORKDIR /shared_folder                                             # Set /shared_folder as the default working directory

CMD ["tail", "-f", "/dev/null"]                                    # Keep the container running (you will exec into it to work)
```

docker-compose.yml:

```yaml
services: # Declare the services to run
  ubuntu-service: # Name of the development service
    build: . # Build the Dockerfile in the current directory
    container_name: my-dev01 # Set a predictable container name
    volumes: # Define storage mounts
      - ./shared_folder:/shared_folder # Map host ./shared_folder to /shared_folder in the container for file sharing
      - ubuntu-data:/root # Named volume to persist /root (including conda environments and settings)
    ports: # Expose container ports on the host
      - "8888:8888" # Map host port 8888 to container port 8888 for Jupyter access
    stdin_open: true # Keep STDIN open for interactive sessions
    tty: true # Allocate a TTY to improve interactive shell experience

volumes: # Define named volumes
  ubuntu-data: # Volume that persists data across rebuilds and restarts
```

#### 3. Build the image

```bash
docker compose build
# docker-compose build
```

#### 4. Start the container

```bash
docker compose up -d
# or:
# docker-compose up -d
```

#### 5. Open a shell in the container (you will land in /shared_folder)

```bash
docker exec -it my-dev01 /bin/bash
```

#### 6. Verify Anaconda

```bash
conda --version
python --version
```

#### 7. Create a Python 3.13 environment and install packages

```bash
conda create -n py313 python=3.13 -y
conda activate py313
pip install jupyter pandas pyarrow requests seaborn matplotlib
```

If conda activate does not work immediately:

```bash
source ~/.bashrc
conda activate py313
```

#### 8. Launch Jupyter Notebook (already in /shared_folder)

```bash
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

## About Docker

### Docker Essentials

Docker packages applications into isolated **containers**.

- **Images:** A `Dockerfile` defines an **image**, which is a blueprint for your app. Each `Dockerfile` instruction creates a read-only **layer**.
- **Containers:** Running an image creates a **container**, an isolated instance of your application.
- **Isolation:** Containers use Linux features (namespaces, cgroups) to keep app processes, network, and resources separate.
- **Networking:** Docker provides virtual networking. Use `-p` to map ports between your host and a container.
- **Persistence:** Container changes are temporary. Use **volumes** to store data persistently outside the container.
- **Efficiency:** Docker reuses identical image layers (via content-based hashes), speeding up builds and uploads.

### Docker Layers & Caching Basics

- **Layers are Building Blocks:** Each instruction in your `Dockerfile` (like `FROM`, `RUN`, `COPY`, `ENV`) creates a new, read-only layer.
- **Stacking Layers:** These layers are stacked on top of each other to form your final Docker image.
- **Writable Top Layer:** When you run a container from an image, a new, thin, writable layer is added on top. Any changes inside the running container go into this layer.
- **Caching for Speed:** Docker intelligently caches these layers. If an instruction and its entire history of preceding layers are identical to a previous build, Docker reuses the cached layer instead of rebuilding it.
- **Order and Content Matter:** For a layer to be reused, not only must the specific instruction be the same, but the content it operates on (e.g., files copied) and the order of all previous instructions must also be identical.
- **Efficiency:** This caching makes builds much faster and reduces storage, as common layers can be shared across multiple images.

## Essential Linux Commands

- **`ls`**: List directory contents.
  - `ls -alh`: Shows all files, detailed info, and human-readable sizes.
- **`cd`**: Change directory.
  - `cd ..`: Go up one level.
  - `cd ~`: Go to home directory.
  - `cd -`: Go to the previous directory.
- **`pwd`**: Print Working Directory (shows your current location).
- **`mkdir` / `rmdir`**: Create / Remove directories.
  - `mkdir -p`: Creates parent directories as needed.
- **`cp` / `mv`**: Copy / Move files and directories.
  - `cp -r`: Copies directories recursively.
  - `mv`: Also used for renaming files/directories.
- **`rm`**: Remove files or directories.
  - `rm -r`: Removes directories recursively.
  - **Caution:** `rm -rf` forces removal and should be used with extreme care.
- **`cat` / `less`**: View file contents.
  - `less`: Allows paging, scrolling, and searching (`/pattern`).
- **`grep`**: Search for text patterns in files.
  - `grep -R "pattern" .`: Searches recursively in the current directory.
  - `grep -n`: Shows line numbers.
- **`find`**: Locate files based on criteria (name, type, size, time).
  - `find . -name "*.py" -type f`: Finds all Python files in the current directory and subdirectories.
- **`ps` / `top`**: Monitor running processes.
  - `ps aux | grep [process_name]`: Find specific processes.
  - `top` (or `htop`): Interactive, real-time process monitoring.
- **`nano` / `vim`**: Terminal-based text editors.
- **`tail -f [logfile]`**: View a log file in real-time as it grows.
- **`du -sh .`**: Summarize disk usage of the current directory (human-readable).
- **`df -h`**: Show disk space usage for mounted filesystems (human-readable).
- **`curl` / `wget`**: Download files or fetch data from URLs.
- **`tar`**: Archive and extract files (e.g., `tar -czf archive.tgz dir/` to compress, `tar -xzf archive.tgz` to extract).
- **`which [command]`**: Shows the full path to an executable command.
- **`history`**: Displays your command history.
