class QuizController < ApplicationController
  def index
  end

  def start
    total = params[ :number].to_i
    all = Question.all.map {|x| x.id}
    session[:questions] = all.sort_by{rand}[0..(total-1)]
    session[:total] = total
    session[:current] = 0
    session[:correct] = 0
    redirect_to :action => 'question'
  end

  def question
    @current = session [:current]
    @total = session [:total]
    if @current >= @total
      redirect_to :action => 'end'
      return
    end
    @question = Question.find (session[:questions][@current])
    @choises = @question.choises.sort_by {rand}
    session[:question] = @question
    session[:choises] = @choises
  end

  def answer
    @current = session[:current]
    @total = session [:total]
    choiceid = params[:choise]
    @question = session [:question]
    @choises = session[:choises]
    if @choise and @choise.correct
      @choise = true
      session[:correct]+=1
     else
     @correct = false

    end
    session[:current] +=1
  end

  def end
    @correct = session [:correct]
    @total = session[:total]
    @score = @correct * 100 / @total 
  end
end
