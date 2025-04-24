using ellevateAPI.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();

// Add CORS policy
builder.Services.AddCors(options =>
{
    options.AddPolicy("DevCorsPolicy", policy =>
    {
        // Allow both localhost and 127.0.0.1 as valid origins
        policy.WithOrigins("http://127.0.0.1:5173", "http://localhost:5173") 
            .AllowAnyMethod()
            .AllowAnyHeader()
            .AllowCredentials(); // Only if credentials like cookies or auth tokens are required
    });
});
builder.Services.AddScoped<IMessageRepository, MessageRepository>();

// Add Swagger/OpenAPI support
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
    app.UseCors("DevCorsPolicy"); // Apply the CORS policy
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();