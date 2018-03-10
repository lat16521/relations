class QuestionsController < ApplicationController
  def index
    @questions = Questions.all
    @questions.sort {|a,b| a.text <=> b.text}

    respond_to do |format|
      format.html
      format.xml { render :xml => @questions}
    end

  end

  def show
    @question = Question.find(params[ :id])
    respond_to do |format|
    format.html
    format.xml { render :xml => @question}
     end
  end

  def new
    @question = Question.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @question}
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params_question)
    respond_to do |format|
    if @question.save
      format.html { redirect_to(@question, :notice => 'Pregunta agregada correctamente.')}
      format.xml { render :xml => @question, :status => :created, :location => @question }
    else
      format.html { render :action => 'new'}
      format.xml {render :xml => @question.erros, :status => :unprocessable_entity }
     end   
     
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params_question)
        format.html {redirect_to(@question, notice => 'pregunta actualizada dcorrectamente.')}
        format.xml { head :ok}
      else
        format.html {render :action => 'edit'}
        format.xml { render :xml => @question.erros, :status => :unprocessable_entity}

      end
  end

  def destroy
    @question = Question.find (params[ :id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to(question_url)}
      format.xml  {head :ok}
  end
end
private
def params_question
  params.require(:question).permit(:text)
end
end