using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Genre
	{
		string genreId;
		string genreName;
		public Genre(string genreId, string genreName)
		{
			this.genreId = genreId;
			this.genreName = genreName;
		}
	}
}