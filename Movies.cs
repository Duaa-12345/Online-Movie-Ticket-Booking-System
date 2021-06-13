using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Movies
	{
		public string movieID;
		public string title;
		string rating;
		public string genreID;
		string duration;
		string description;
		string director;
		string cast;

		public Movies(string movieID, string title, string rating, string genreID, string duration, string description, string director, string cast)
		{
			this.movieID = movieID;
			this.title = title;
			this.rating = rating;
			this.genreID = genreID;
			this.duration = duration;
			this.description = description;
			this.director = director;
			this.cast = cast;
		}
	}
}