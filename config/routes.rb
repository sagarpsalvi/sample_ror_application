Rails.application.routes.draw do
	get 'book/list'
	get 'book/new'
	post 'book/create'
	patch 'book/update'
	get 'book/list'
	get 'book/show'
	get 'book/edit'
	get 'book/delete'
	get 'book/update'
	get 'book/show_subjects'
	get 'test/all_data'
  #
	get 'api/v1/clauses'
	post 'api/v1/clauses'
	delete 'api/v1/clauses'
  #
  get 'api/v1/document'
  post 'api/v1/document'
  delete 'api/v1/document'
end