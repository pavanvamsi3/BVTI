namespace FabrikamFiber.Web.Tests.Controllers
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.DAL.Models;
    using FabrikamFiber.Web.Controllers;
    using FabrikamFiber.Web.ViewModels;
    using NUnit.Framework;
    using NUnit.Mocks;

    [TestFixture]
    public class ServiceTicketsControllerTest
    {
        DynamicMock mockCustomerRepo;
        DynamicMock mockEmployeeRepo;
        DynamicMock mockServiceTicketRepo;
        DynamicMock mockLogEntryRepo;
        DynamicMock mockScheduleItemRepo;
        ServiceTicketsController controller;

        [SetUp]
        public void SetupController()
        {
            mockCustomerRepo = new DynamicMock(typeof(ICustomerRepository));
            mockEmployeeRepo = new DynamicMock(typeof(IEmployeeRepository));
            mockServiceTicketRepo = new DynamicMock(typeof(IServiceTicketRepository));
            mockLogEntryRepo = new DynamicMock(typeof(IServiceLogEntryRepository));
            mockScheduleItemRepo = new DynamicMock(typeof(IScheduleItemRepository));

            controller = new ServiceTicketsController(
                mockCustomerRepo.MockInstance as ICustomerRepository,
                mockEmployeeRepo.MockInstance as IEmployeeRepository,
                mockServiceTicketRepo.MockInstance as IServiceTicketRepository,
                mockLogEntryRepo.MockInstance as IServiceLogEntryRepository,
                mockScheduleItemRepo.MockInstance as IScheduleItemRepository
            );
        }


       
    }
}
