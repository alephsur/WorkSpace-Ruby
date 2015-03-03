class MoviesController<ApplicationController
	def index
		@movies = Movie.all
	end

	def show
		id = params[:id]
		@movie = Movie.find(id)
	end

	def new

	end

	def create  
		@rel_date = params[:movie]["release_date(3i)"] + "/" +params[:movie]["release_date(2i)"] + "/" + params[:movie]["release_date(1i)"] + "/"   
		@movie = Movie.create!(:title=>params[:movie]["title"], :rating=>"PG",:release_date=>@rel_date )

		flash[:notice] = "#{@movie.title} was successfully created."

		redirect_to movies_path
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@rel_date = params[:movie]["release_date(3i)"] + "/" +params[:movie]["release_date(2i)"] + "/" + params[:movie]["release_date(1i)"] + "/"   


		actualizar =  Hash.new 
		actualizar[:title] = params[:movie][:title]
		actualizar[:rating] = params[:movie][:rating]
		actualizar[:release_date] = @rel_date
		actualizar[:id] = params[:id]


		@movie.update_attributes!(actualizar)

		flash[:notice] = "#{@movie.title} was successfully updated."

		respond_to do |client_wants|

			client_wants.html { redirect_to movie_path(@movie)}

			client_wants.xml{render :xml => @movie.to_xml}
		end
		#redirect_to movies_path
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "#{@movie.title} was successfully destroyed"
		redirect_to movies_path
	end

	def search_tmdb
		#flash[:warning] = params["search_terms"]
		flash[:warning] = "Movie was not found in TMDb"
		redirect_to movies_path		
	end
end