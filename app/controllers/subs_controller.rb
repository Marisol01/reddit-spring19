class SubsController < ApplicationController
  # views user in teraction logic at minimum
  #controller / routes directing traffic, actions
  #models all logic on the table /record

  # skinny controllers / fat models

# Reads / GET req
#   shows all the items in the model
#   index @model_names = Model_name.all

#   search record to update / renders the edit form
#   edit @model_name = Model_name.find(params[:id])

#   search record / shows a specific single record
#   show @model_name = Model_name.find(params[:id])

#   creates a recorc in memory / rendering new form
#   new @model_name = Model_name.new

#   Post onto database
#   create Model_name.create(model_name_params)
  # @model_name = Model_name.new(model_name_params)

  # if @model_name.save
  #   do something
  #   else 
  #     render :new

  #   end

#   Update / put/patch
#   update Model_name.find(params[:id]).update(model_name_params)


#   Destroy / Delete
#   destroy Model_name.find(params[:id]).destroy

# # model_name_params
# private
# def model_name_params
#   params.require(:model_name).permit(:everything the model has)
# end

# callbacks 
# before_action
# after_action
# skip_before_action
# skip_after_action


#to not repeat yourself
before_action :find_sub, only: [:show, :update, :edit, :destroy]
# before_action :find_sub, execpt: [:index, :new, :create]

#get
  def index
    @subs = Sub.all
    # renders the index.html
  end

  #get
  def show
    #renders show.html.erb
  end

  #get
  def new
    @sub = Sub.new
    #renders new.html.erb

    render partial: 'subs/form'
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end 
  end

  #get
  def edit 
    #renders edit.html.erb

  render partial: 'subs/form'
  end

  def update

    if @sub.update(model_name_params)
      redirect_to @sub
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private
  def sub_params
    params.require(:sub).permit(:name)
  end

  # you can use this to not repeat this code in each method along with the before_action message on top
  def find_sub
    @sub = Sub.find(params[:id])
  end

end
