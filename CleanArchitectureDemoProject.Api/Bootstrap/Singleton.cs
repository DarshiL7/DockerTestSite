using CleanArchitectureDemoProject.BoundedContext.Singleton;
using CleanArchitectureDemoProject.Infrastructure.Singleton;

using Microsoft.Extensions.DependencyInjection;

using RxWeb.Core.Data;

namespace CleanArchitectureDemoProject.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




