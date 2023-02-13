import setuptools

with open("README.md", "r") as fh:

    long_description = fh.read()

setuptools.setup(

    name="Joshua Rose", # Replace with your username

    version="1.0.0",

    author="Joshua Rose",

    author_email="joshuarose099@gmail.com",

    description="Unit testing framework",

    long_description="A unit testing framework that allows for both continuous integration and seamless github integration",

    long_description_content_type="text/markdown",

    url="https://github.com/JoshuaDRose/unit-testing",

    packages=setuptools.find_packages(),

    classifiers=[

        "Programming Language :: Python :: 3",

        "License :: OSI Approved :: MIT License",

        "Operating System :: OS Independent",

    ],

    python_requires='>=3.6',

)
