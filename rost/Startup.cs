using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(rost.Startup))]
namespace rost
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
