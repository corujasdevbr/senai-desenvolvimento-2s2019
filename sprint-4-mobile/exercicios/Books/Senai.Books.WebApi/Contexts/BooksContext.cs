using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Senai.Books.WebApi.Domains
{
    public partial class BooksContext : DbContext
    {
        public BooksContext()
        {
        }

        public BooksContext(DbContextOptions<BooksContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Editoras> Editoras { get; set; }
        public virtual DbSet<Generos> Generos { get; set; }
        public virtual DbSet<Livros> Livros { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=localhost; Initial Catalog=Books; Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Editoras>(entity =>
            {
                entity.HasKey(e => e.EditoraId);

                entity.Property(e => e.EditoraId).HasColumnName("EditoraID");

                entity.Property(e => e.Nome)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Generos>(entity =>
            {
                entity.HasKey(e => e.GeneroId);

                entity.Property(e => e.GeneroId).HasColumnName("GeneroID");

                entity.Property(e => e.Nome)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Livros>(entity =>
            {
                entity.HasKey(e => e.LivroId);

                entity.HasIndex(e => e.Nome)
                    .HasName("UQ__Livros__7D8FE3B2905897D7")
                    .IsUnique();

                entity.Property(e => e.LivroId).HasColumnName("LivroID");

                entity.Property(e => e.Autor)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Nome)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.HasOne(d => d.EditoraNavigation)
                    .WithMany(p => p.Livros)
                    .HasForeignKey(d => d.Editora)
                    .HasConstraintName("FK__Livros__Editora__3D5E1FD2");

                entity.HasOne(d => d.GeneroNavigation)
                    .WithMany(p => p.Livros)
                    .HasForeignKey(d => d.Genero)
                    .HasConstraintName("FK__Livros__Genero__3C69FB99");
            });
        }
    }
}
