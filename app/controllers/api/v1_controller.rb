require 'json'
class Api::V1Controller < ApplicationController


  def clauses
    #Currently used dummy data
    #will change after sometime

    case request.method_symbol
      when :get
        @clauses = Clause.all
        render :json => @clauses
      when :post
        data = JSON.parse(request.body.read)
        #
        is_clause = false
        is_title = false
        error = {}
        error_description = ''
        error_title = ''
        if data['clause_text'].to_s.empty?
          is_clause = true
        end

        if is_clause
          error_description = 'Invalid Description'
        end

        if data['title'].to_s.empty?
          is_title = true
          puts '###%s'%data['title'].to_s.empty?
        end

        if is_title
          error_title = 'Invalid title'
        end
        #


        if is_clause or is_title
          error['error'] = error_description + '\n' + error_title
          render :json => error
        else
          @clauses = Clause.new(:tag => data['tag'],
                                :clause_text => data['clause_text'],
                                :title => data['title'])

          @clauses.save
          if @clauses.save
            render :json => @clauses
          else
            @clauses = Clause.all
            render :json => @clauses
          end
        end





    end

  end

  def clause_params

    params.require(:clauses).permit(:tag, :clause_text, :title)
  end

  def create
    data = JSON.parse(request.body.read)
    puts '############%s'%request.method_symbol

    @clauses = Clause.new(:tag => data['tag'],
                        :clause_text => data['clause_text'],
                        :title => data['title'])
    #@clauses.save
    if @clauses.save
      render :json => @clauses
    else
      @clauses = Clause.all
      render :json => @clauses
    end
  end

end
