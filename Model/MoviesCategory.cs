using System;
using System.Collections.Generic;

#nullable disable

namespace MoviesCoreAPI.Model
{
    public partial class MoviesCategory
    {
        public long CategoryId { get; set; }
        public string Name { get; set; }
        public long? Parent { get; set; }
    }
}
