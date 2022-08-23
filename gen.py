# make sure you're logged in with `huggingface-cli login`
from torch import autocast
from diffusers import StableDiffusionPipeline

mode = "cpu" # "cuda"

pipe = StableDiffusionPipeline.from_pretrained(
	"CompVis/stable-diffusion-v1-1", 
	use_auth_token=True
).to(mode)

prompt = "a photo of an astronaut riding a horse on mars"
with autocast(mode):
    image = pipe(prompt)["sample"][0]  
    
image.save("astronaut_rides_horse.png")
