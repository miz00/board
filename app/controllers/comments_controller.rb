class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @my_thread = MyThread.find(params[:my_thread_id])
    @comments = Comment.where(my_thread_id: params[:my_thread_id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @my_thread = MyThread.find(params[:my_thread_id])
    redirect_to my_thread_comment_path(@my_thread,@comment)
  end

  # GET /comments/new
  def new
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit 
  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to my_thread_comments_path(@my_thread), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @my_thread = MyThread.find(params[:my_thread_id])
    respond_to do |format|
      if @comment.update(comment_params) 
        format.html { redirect_to my_thread_comments_path(@my_thread), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to my_thread_comments_path(params[:my_thread_id]), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment).
        merge(my_thread_id: params[:my_thread_id])
    end
end
