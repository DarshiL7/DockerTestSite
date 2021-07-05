using CleanArchitectureDemoProject.BoundedContext.Main;

using RxWeb.Core.Data;

namespace CleanArchitectureDemoProject.UnitOfWork.Main
{
    public class LoginUow : BaseUow, ILoginUow
    {
        public LoginUow(ILoginContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface ILoginUow : ICoreUnitOfWork { }
}


