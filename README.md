# wandb-notebook-testing


```bash
docker build -t vwxyzjn/wandb-notebook -f Dockerfile .
docker push vwxyzjn/wandb-notebook:latest
```


```
docker run -e WANDB_ENTITY=xxx -e WANDB_API_KEY=xxxx vwxyzjn/wandb-notebook jupyter nbconvert --to notebook --inplace --execute "colabs/intro/Intro_to_Weights_&_Biases.ipynb"
```