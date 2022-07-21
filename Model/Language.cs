using System;
using System.Collections.Generic;

#nullable disable

namespace MoviesCoreAPI.Model
{
    public partial class Language
    {
        public long LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string LanguageFlag { get; set; }
    }
}
