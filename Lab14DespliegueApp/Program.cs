var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => Results.Ok(new
{
    mensaje = "Laboratorio 14 - Aplicación .NET desplegada correctamente",
    estudiante = "Esteban Aguilar",
    fecha = DateTime.UtcNow
}));

app.MapGet("/api/productos", () => Results.Ok(new[]
{
    new { Id = 1, Nombre = "Laptop Lenovo", Precio = 3800.00 },
    new { Id = 2, Nombre = "Monitor 27 pulgadas", Precio = 950.00 },
    new { Id = 3, Nombre = "Teclado Mecánico", Precio = 280.00 }
}));

app.Run();
