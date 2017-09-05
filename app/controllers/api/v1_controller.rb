require 'json'
class Api::V1Controller < ApplicationController


  def clauses
    #Currently used dummy data
    #will change after sometime
    case request.method_symbol
      when :get
        if params[:id]
          begin
            @clauses = Clause.where(is_delete: false).find(params[:id])
            render :json => @clauses
          rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
            render :json => {'error' => 'Clause not found'}
          end
        elsif
          @clauses = Clause.where(is_delete: false)
          render :json => @clauses.order(id: :desc)
        end
      when :get
        @clauses = Clause.where(is_delete: false)
        render :json => @clauses.order(id: :desc)
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
                                :title => data['title'],
                                :is_delete => false)

          @clauses.save
          if @clauses.save
            render :json => @clauses
          else
            @clauses = Clause.all
            render :json => @clauses
          end
        end
      when :delete
        begin
          puts params[:id]
          @clauses = Clause.find(params[:id])
          @clauses.update_column(:is_delete, true )
          render :json =>  {'message' => 'clauses deleted successfully'}
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
          render :json => {'error' => 'Clause not found'}
        end

    end

  end

  def document
    case request.method_symbol
      when :get
        if params[:id]
          begin
            puts params[:id]
            @document = Document.find(params[:id])
            render :json => @document
          rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
            render :json => {'error' => 'Document not found'}
          end
        elsif
          @document = Document.where(is_delete: false)
          render :json => @document.order(id: :desc)
        end
      when :post
        data = JSON.parse(request.body.read)
        #
        if data['document'].to_s.empty?
          error = {}
          error['error'] = 'Document required.'
          render :json => error
        elsif
          @document = Document.new(:document => data['document'],
                                   :title => data['title'],
                                   :is_delete => false)

          @document.save
          if @document.save
            render :json => @document
          else
            @document = Document.all
            render :json => @document
          end
        end
      when :delete
        begin
          puts params[:id]
          @document = Document.where(is_delete: false).find(params[:id])
          @document.update_column(:is_delete, true )
          render :json => {'message' => 'Document deleted successfully'}
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
          render :json => {'error' => 'Document not found'}
        end
    end
  end


end

