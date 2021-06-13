using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MvcApplication1.Models
{
	public class CRUD 
	{   //use Integrated Security= true instead of User ID and password for windows authentication.

        public static string connectionString = "data source=DESKTOP-6J81TAT; Initial Catalog=MovieTicketing;Integrated Security=true";
		public static Users getuserinfo(string username)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;

			try
			{
				cmd = new SqlCommand("getUserInfo", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@uname", SqlDbType.NVarChar, 10).Value = username;

				cmd.ExecuteNonQuery();

				SqlDataReader rdr = cmd.ExecuteReader();
				
				if (rdr.Read())
				{
					string userId = rdr["userID"].ToString();
					string fname = rdr["userFname"].ToString();
					string lname = rdr["userLname"].ToString();
					string age = rdr["age"].ToString();
					//string username = rdr["username"].ToString();
					string pass = rdr["password"].ToString();
					string email = rdr["email"].ToString();
					string gender = rdr["gender"].ToString();
					Users user = new Users(userId,fname,lname,age,username,pass,email,gender);
					//System.Diagnostics.Debug.WriteLine("SomeText"+username+"\t"+fname);
					return user;
				}
				
				rdr.Close();
				con.Close();

				return null;


			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				return null;

			}

		}

		public static Genre getGenreInfo(int genreId)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;

			try
			{
				cmd = new SqlCommand("getGenreInfo", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@genreId", SqlDbType.Int).Value = genreId;

				cmd.ExecuteNonQuery();

				SqlDataReader rdr = cmd.ExecuteReader();

				if (rdr.Read())
				{
					string genreID = rdr["genreID"].ToString();
					string genreName = rdr["genreName"].ToString();
					
					Genre genre = new Genre(genreID,genreName);
					System.Diagnostics.Debug.WriteLine("SomeText" + genreID + "\t" + genreName);
					return genre;
				}

				rdr.Close();
				con.Close();

				return null;


			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				return null;

			}
		}

		public static int TicketBooking(int userID, int cinemaID, int movieID, int v1, DateTime now, int v2)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;
			int result = 0;

			try
			{
				cmd = new SqlCommand("TicketBooking", con)
				{
					CommandType = System.Data.CommandType.StoredProcedure
				};
				cmd.Parameters.Add("@userID", System.Data.SqlDbType.Int).Value = userID;
				cmd.Parameters.Add("@cID", System.Data.SqlDbType.Int).Value = cinemaID;
				cmd.Parameters.Add("@mID", System.Data.SqlDbType.Int).Value = movieID;
				cmd.Parameters.Add("@slots", System.Data.SqlDbType.Int).Value = v1;
				cmd.Parameters.Add("@date", System.Data.SqlDbType.Date).Value = now;
				cmd.Parameters.Add("@seatNo", System.Data.SqlDbType.Int).Value = v2;

				cmd.ExecuteNonQuery();


			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error"
					+ ex.Message.ToString());
				result = -1; //-1 will be interpreted as "error while connecting with the database."
			}
			finally
			{
				con.Close();
			}
			return result;
		}

		public static int SIGNUP(string fName, string lName, int age, string username, string password, string email, string gender)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;
			int result = 0;

			try
			{
				cmd = new SqlCommand("SIGNUP", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@userFname", SqlDbType.NVarChar, 10).Value = fName;
				cmd.Parameters.Add("@userLname", SqlDbType.NVarChar, 10).Value = lName;
				cmd.Parameters.Add("@age", SqlDbType.Int).Value = age;
				cmd.Parameters.Add("@username", SqlDbType.NVarChar, 10).Value = username;
				cmd.Parameters.Add("@password", SqlDbType.NVarChar, 8).Value = password;
				cmd.Parameters.Add("@email", SqlDbType.NVarChar, 20).Value = email;
				cmd.Parameters.Add("@gender", SqlDbType.NVarChar, 10).Value = gender;


				cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

				cmd.ExecuteNonQuery();
				result = Convert.ToInt32(cmd.Parameters["@ret"].Value);

			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				System.Diagnostics.Debug.WriteLine("SQL Error" + ex.Message.ToString());
				result = -1; //-1 will be interpreted as "error while connecting with the database."
			}
			finally
			{
				con.Close();
			}
			return result;
		}

		public static Movies getMovieInfo(int movieId)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;

			try
			{
				cmd = new SqlCommand("getMovieInfo", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;

				cmd.ExecuteNonQuery();

				SqlDataReader rdr = cmd.ExecuteReader();

				if (rdr.Read())
				{
					string movieID = rdr["movieID"].ToString();
					string title = rdr["title"].ToString();
					string rating = rdr["rating"].ToString();
					string genreID = rdr["genreID"].ToString();
					string duration = rdr["duration"].ToString();
					string description = rdr["description"].ToString();
					string director = rdr["director"].ToString();
					string cast = rdr["cast"].ToString();
					Movies movie = new Movies(movieID, title, rating, genreID, duration, description, director, cast);
					System.Diagnostics.Debug.WriteLine("SomeText" + title + "\t" + genreID);
					return movie;
				}

				rdr.Close();
				con.Close();

				return null;


			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				return null;

			}
		}

		public static Cinemas getCinemaInfo(int cinemaId)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;

			try
			{
				cmd = new SqlCommand("getCinemaInfo", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@cinemaId", SqlDbType.Int).Value = cinemaId;

				cmd.ExecuteNonQuery();

				SqlDataReader rdr = cmd.ExecuteReader();

				if (rdr.Read())
				{
					string cinemaID = rdr["cinemaID"].ToString();
					string cinemaName = rdr["cinemaName"].ToString();
					string location = rdr["location"].ToString();
					string contactNum = rdr["contactNum"].ToString();
					//string username = rdr["username"].ToString();
					string email = rdr["email"].ToString();
					string price = rdr["price"].ToString();
					Cinemas cinema = new Cinemas(cinemaID, cinemaName, location, contactNum, email, price);
					System.Diagnostics.Debug.WriteLine("SomeText"+cinemaID+"\t"+cinemaName);
					return cinema;
				}

				rdr.Close();
				con.Close();

				return null;


			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				return null;

			}
		}

		public static int Login(string username, string password)
		{

			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;
			int result = 0;

			try
			{
				cmd = new SqlCommand("userLOGIN", con)
				{
					CommandType = System.Data.CommandType.StoredProcedure
				};
				cmd.Parameters.Add("@username", System.Data.SqlDbType.NVarChar, 10).Value = username;
				cmd.Parameters.Add("@password", System.Data.SqlDbType.NVarChar, 8).Value = password;
				cmd.Parameters.Add("@ret", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

				cmd.ExecuteNonQuery();
				result = Convert.ToInt32(cmd.Parameters["@ret"].Value);


			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error"
					+ ex.Message.ToString());
				result = -1; //-1 will be interpreted as "error while connecting with the database."
			}
			finally
			{
				con.Close();
			}
			return result;

		}
		
		
		public static int Logout(string email)
		{

			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;
			int result = 0;

			try
			{
				cmd = new SqlCommand("sp_UserLogout", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email;
				cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

				cmd.ExecuteNonQuery();
				result = Convert.ToInt32(cmd.Parameters["@output"].Value);
			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				result = -1; //-1 will be interpreted as "error while connecting with the database."
			}
			finally
			{
				con.Close();
			}
			return result;

		}
        //public static int AdminLogout(string email)
        //{
        //    SqlConnection con = new SqlConnection(connectionString);
        //    con.Open();
        //    SqlCommand cmd;
        //    int result = 0;

        //    try
        //    {
        //        cmd = new SqlCommand("sp_AdminLogout", con);
        //        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //        cmd.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar, 50).Value = email;
        //        cmd.Parameters.Add("@output", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

        //        cmd.ExecuteNonQuery();
        //        result = Convert.ToInt32(cmd.Parameters["@output"].Value);
        //    }

        //    catch (SqlException ex)
        //    {
        //        Console.WriteLine("SQL Error" + ex.Message.ToString());
        //        result = -1; //-1 will be interpreted as "error while connecting with the database."
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return result;

        //}

		public static List<Movies> getMovies(int genreId)
		{
			SqlConnection con = new SqlConnection(connectionString);
			con.Open();
			SqlCommand cmd;

			try
			{
				cmd = new SqlCommand("getMovies", con);
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.Parameters.Add("@genreId", System.Data.SqlDbType.Int).Value = genreId;

				cmd.ExecuteNonQuery();

				List<Movies> movies = new List<Movies>();

				SqlDataReader rdr = cmd.ExecuteReader();

				while (rdr.Read())
				{
					
					string movieID  = rdr["movieID"].ToString();
					string title = rdr["title"].ToString();
					string rating = rdr["rating"].ToString();
					string genreID = rdr["genreID"].ToString();
					string duration = rdr["duration"].ToString();
					string description = rdr["description"].ToString();
					string director = rdr["director"].ToString();
					string cast = rdr["cast"].ToString();
					Movies movie = new Movies(movieID,title,rating,genreID,duration,description,director,cast);
					movies.Add(movie);
				}
				rdr.Close();

				return movies;
			}

			catch (SqlException ex)
			{
				Console.WriteLine("SQL Error" + ex.Message.ToString());
				return null;

			}
			finally
			{
				con.Close();
			}
		}

        /*public static List<Schedule> getMovies(ModelView m)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("DISPLAY_MOVIE_SCHEDULE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@cid", System.Data.SqlDbType.Int).Value = m.getCinemaID();
                cmd.Parameters.Add("@gid", System.Data.SqlDbType.Int).Value = m.getGenreID();
                cmd.Parameters.Add("@day", System.Data.SqlDbType.Int).Value = "Monday";
                cmd.ExecuteNonQuery();

                List<Schedule> movies = new List<Schedule>();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {

                    /*string movieID  = rdr["movieID"].ToString();
                    string title = rdr["title"].ToString();
                    string rating = rdr["rating"].ToString();
                    string genreID = rdr["genreID"].ToString();
                    string duration = rdr["duration"].ToString();
                    string description = rdr["description"].ToString();
                    string director = rdr["director"].ToString();
                    string cast = rdr["cast"].ToString();

                    String cinemaID = rdr["cid"].ToString();
                    String cinemaname = rdr["cname"].ToString();
                    String Movie_title = rdr["movie_title"].ToString();
                    String Starttime = rdr["start_time"].ToString();
                    String Endtime = rdr["end_time"].ToString();
                    String day = rdr["DAY"].ToString();
                    Schedule movie = new Schedule(Movie_title, Starttime);
                    movies.Add(movie);
                }
                rdr.Close();

                return movies;
            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }
            finally
            {
                con.Close();
            }
        }*/

	}
}