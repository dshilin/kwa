class PromotionsController < ApplicationController
  filter_access_to :new, :edit, :destroy, :update, :create
  # GET /promotions
  # GET /promotions.xml
  def index
    @promotions = Promotion.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promotions }
    end
  end

  # GET /promotions/new
  # GET /promotions/new.xml
  def new
    @promotion = Promotion.new
    @categories = Category.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @promotion }
    end
  end

  # GET /promotions/1/edit
  def edit
    @promotion = Promotion.find(params[:id])
    @categories = Category.find(:all)
  end

  # POST /promotions
  # POST /promotions.xml
  def create
    @promotion = Promotion.new(params[:promotion])
    @categories = Category.find(:all)
    respond_to do |format|
      if @promotion.save
        flash[:notice] = 'Тектс успешно добавлен.'
        format.html { redirect_to(promotions_path) }
        format.xml  { render :xml => @promotion, :status => :created, :location => @promotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /promotions/1
  # PUT /promotions/1.xml
  def update
    @promotion = Promotion.find(params[:id])
    respond_to do |format|
      if @promotion.update_attributes(params[:promotion])
        flash[:notice] = 'Текст отредактирован.'
        format.html { redirect_to(promotions_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.xml
  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to(promotions_url) }
      format.xml  { head :ok }
    end
  end
end
