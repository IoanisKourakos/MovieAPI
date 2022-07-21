using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace MoviesCoreAPI.Model
{
    public partial class MovieDBContext : DbContext
    {
        public MovieDBContext()
        {
        }

        public MovieDBContext(DbContextOptions<MovieDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Director> Directors { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<MoviesCategory> MoviesCategories { get; set; }
        public virtual DbSet<Price> Prices { get; set; }
        public virtual DbSet<Rating> Ratings { get; set; }
        public virtual DbSet<Rental> Rentals { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
 //To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=MovieDB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Greek_CI_AS");

            modelBuilder.Entity<Director>(entity =>
            {
                entity.Property(e => e.DirectorId).HasColumnName("DirectorID");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<Language>(entity =>
            {
                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.LanguageFlag).HasMaxLength(50);

                entity.Property(e => e.LanguageName).HasMaxLength(50);
            });

            modelBuilder.Entity<Movie>(entity =>
            {
                entity.Property(e => e.MovieId).HasColumnName("MovieID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.DateRelease).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(550);

                entity.Property(e => e.DirectorId).HasColumnName("DirectorID");

                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.PromoImage).HasMaxLength(550);

                entity.Property(e => e.RatingId).HasColumnName("RatingID");

                entity.Property(e => e.Title).HasMaxLength(150);
            });

            modelBuilder.Entity<MoviesCategory>(entity =>
            {
                entity.HasKey(e => e.CategoryId);

                entity.ToTable("MoviesCategory");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.Name).HasMaxLength(200);
            });

            modelBuilder.Entity<Price>(entity =>
            {
                entity.Property(e => e.PriceId).HasColumnName("PriceID");

                entity.Property(e => e.DefaultPricePerDay).HasColumnType("decimal(19, 2)");

                entity.Property(e => e.MovieId).HasColumnName("MovieID");

                entity.Property(e => e.OfferEndDate).HasColumnType("datetime");

                entity.Property(e => e.OfferPricePerDay).HasColumnType("decimal(19, 2)");

                entity.Property(e => e.OfferStartDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<Rating>(entity =>
            {
                entity.ToTable("Rating");

                entity.Property(e => e.RatingId).HasColumnName("RatingID");

                entity.Property(e => e.Rating1).HasColumnName("Rating");
            });

            modelBuilder.Entity<Rental>(entity =>
            {
                entity.Property(e => e.RentalId).HasColumnName("RentalID");

                entity.Property(e => e.MovieId).HasColumnName("MovieID");

                entity.Property(e => e.PriceId).HasColumnName("PriceID");

                entity.Property(e => e.RentalDate).HasColumnType("datetime");

                entity.Property(e => e.UserId).HasColumnName("UserID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
