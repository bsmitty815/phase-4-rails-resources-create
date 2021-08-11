class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # POST
  def create
      # params[:id] refers to the dynamic part of our route, defined by :id
      # # a request to /birds/2 would give params[:id] a value of 2
      # bird = Bird.find_by(id: params[:id])
      # render json: bird
      bird = Bird.create(name: params[:name], species: params[:species])
      render json: bird, status: :created


      # (byebug) request
      # #<ActionDispatch::Request POST "http://localhost:3000/birds" for ::1> 

      # request.request_method
      # request.headers["Content-Type"]
      # request.body.read

      # (byebug) JSON.parse(request.body.read)
      # {"name"=>"Monk Parakeet", "species"=>"Myiopsitta monachus"} 

      # (byebug) params
      # #<ActionController::Parameters {"name"=>"Monk Parakeet", "species"=>"Myiopsitta monachus", "controller"=>"birds", "action"=>"create", "bird"=>{"name"=>"Monk Parakeet", "species"=>"Myiopsitta monachus"}} permitted: false> 


      # postman
      # {
      # "name": "Monk Parakeet",
      # "species": "Myiopsitta monachus"
      # }   
  end

end