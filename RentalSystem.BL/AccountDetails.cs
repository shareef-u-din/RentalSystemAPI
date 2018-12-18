﻿using AutoMapper;
using RentalSystem.BL.Helper;
using RentalSystem.DAL;
using RentalSystem.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RentalSystem.BL
{
    public class AccountDetails
    {
        private UserLoginsDAL db = null;

        public AccountDetails()
        {
            db = new UserLoginsDAL();
        }
        public UserLoginModel Registration(UserLoginModel userLoginModel)
        {
            UserLogin userLogin = new UserLogin();
            Mapper.Map(userLoginModel, userLogin);
            bool status = false;
            try
            {
                status = db.Register(userLogin);
            }
            catch (Exception e)
            {

                throw e;
            }
            if (status)
                return userLoginModel;
            else
                return null;
        }
        public UserLoginModel Login(UserLoginModel userLoginModel)
        {
            UserLogin userLogin = new UserLogin();
            Mapper.Map(userLoginModel, userLogin);
            int roleId = 0;
            try
            {
                roleId = db.Login(userLogin);
            }
            catch (Exception e)
            {

                throw e;
            }
            if (Role.Admin.Equals(roleId))
            {
                userLoginModel.RoleId = (int)Role.Admin;
            }
            else if (Role.Customer.Equals(roleId))
            {
                userLoginModel.RoleId = (int)Role.Customer;
            }
            else if (Role.Vendor.Equals(roleId))
            {
                userLoginModel.RoleId = (int)Role.Vendor;
            }
            else { userLoginModel = null; }
            return userLoginModel;
        }
        public UserModel GetUser(string email)
        {
            UserModel userModel = null;
            DataSet ds = null;
            try
            {
                ds = db.GetUser(email);

                DataRow dataRow = ds.Tables[0].Select().First();

                User user = new User
                {
                    Id = int.Parse(dataRow["Id"].ToString()),
                    Name = dataRow["Name"].ToString(),
                    Email = dataRow["Email"].ToString(),
                    Contact = dataRow["Contact"].ToString(),
                    Address = dataRow["Address"].ToString(),
                    Photo = dataRow["Photo"].ToString(),
                    Valid = Convert.ToBoolean(dataRow["Valid"].ToString()),
                    Age = int.Parse(dataRow["Age"].ToString()),
                    PaymentId = Convert.ToInt32(dataRow["PaymentId"].ToString())
                };
                if (user != null)
                {
                    userModel = new UserModel();
                    Mapper.Map(user, userModel);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return userModel;
        }

        public IEnumerable<UserLoginModel> GetUserLogins()
        {
            IEnumerable<UserLoginModel> users = null;
            DataSet ds = null;
            try
            {
                ds = db.GetUserLogins();
                users = ListHelper.DataSetToUserLogins(ds);
            }
            catch (Exception e)
            {

                throw e;
            }

            return users;
        }


    }
}
