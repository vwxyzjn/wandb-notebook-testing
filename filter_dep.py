import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--file', type=str, default="2021-6-23_colab.txt",
    help='the path to the requirements.txt')
args = parser.parse_args()

maintained_packages = [
    "dopamine-rl",
    "fastai",
    "gym",
    "jax",
    "Keras",
    "lightgbm",
    "numpy",
    "pandas",
    "scikit-learn",
    "tensorboard",
    "tensorflow",
    "torch",
    "torchtext",
    "torchvision",
]

pinned_packages = []
with open("2021-6-23_colab.txt", 'r') as f:
    for l in f.readlines():
        package, version = l.split("==")
        version = version.rstrip("\n").split("+")[0] # handle `torch==1.9.0+cu102`
        if package not in maintained_packages:
            continue
        pinned_packages += [f"{package}=={version}"]

print(pinned_packages)

with open("requirements.txt", "w") as f:
    for item in pinned_packages:
        f.write(item+"\n")