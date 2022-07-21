using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using MoviesCoreAPI.Model;

namespace MoviesCoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public MoviesController(IConfiguration configuration)
        {
            _configuration = configuration;

        }

        [HttpGet]
        public JsonResult Get()
        {
            MovieDBContext context = new MovieDBContext();
            var allmovies = (from i in context.Movies select i).ToList();
            return new JsonResult(allmovies);
        }

        [HttpPost]
        public JsonResult Post(Movie mov)
        {
            MovieDBContext context = new MovieDBContext();
            Movie addmov = new Movie();
            addmov.Title = mov.Title;
            context.Movies.Add(addmov);
            context.SaveChanges();
            return new JsonResult("Movie Added Successfully");
        }

        [HttpPut]
        public JsonResult Put(Movie mov)
        {
            MovieDBContext context = new MovieDBContext();
            var upmovie = (from i in context.Movies where i.MovieId == mov.MovieId select i).FirstOrDefault();
            upmovie.Title = mov.Title;
            context.SaveChanges();
            return new JsonResult("Movie Update Successfully");
        }

        [HttpDelete("{id}")]
        public JsonResult Delete(Int64 id)
        {
            MovieDBContext context = new MovieDBContext();
            var upmovie = (from i in context.Movies where i.MovieId == id select i).FirstOrDefault();
            context.Movies.Remove(upmovie);
            context.SaveChanges();
            return new JsonResult("Movie Deleted Successfully");
        }
    }
}
