using Microsoft.AspNetCore.Mvc;

namespace ellevateAPI.Controllers;

public class ResourceController(ILogger<ResourceController> logger) : Controller
{
    private readonly ILogger _logger = logger;

    // GET
    public IActionResult GetResources()
    {
        return View();
    }
}