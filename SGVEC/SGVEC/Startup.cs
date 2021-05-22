using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SGVEC.Startup))]
namespace SGVEC
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
