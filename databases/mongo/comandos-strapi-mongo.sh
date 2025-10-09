1️⃣ Listar todos los objetos

Para ver cualquier archivo que tenga la URL vieja en url principal o en cualquier formats.*.url:

db.upload_file.find(
  {
    $or: [
      { url: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } },
      { "formats.thumbnail.url": { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } },
      { "formats.small.url": { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } },
      { "formats.medium.url": { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } },
      { "formats.large.url": { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } }
    ]
  },
  { _id: 1, name: 1, url: 1, formats: 1 }
).pretty();


2️⃣ Contar cuántos objetos tienen la URL vieja
db.upload_file.countDocuments(
  {
    $or: [
      { url: { $regex: /ubits-pdn-s3-lxp-strapicontent\.ubitslearning\.com/ } },
      { "formats.thumbnail.url": { $regex: /ubits-pdn-s3-lxp-strapicontent\.ubitslearning\.com/ } },
      { "formats.small.url": { $regex: /ubits-pdn-s3-lxp-strapicontent\.ubitslearning\.com/ } },
      { "formats.medium.url": { $regex: /ubits-pdn-s3-lxp-strapicontent\.ubitslearning\.com/ } },
      { "formats.large.url": { $regex: /ubits-pdn-s3-lxp-strapicontent\.ubitslearning\.com/ } }
    ]
  }
);

Contar cuántos registros NO tienen la URL en ningún campo
db.upload_file.countDocuments({
  $and: [
    { url: { $not: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } } },
    { previewUrl: { $not: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } } },
    { "formats.thumbnail.url": { $not: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } } },
    { "formats.small.url": { $not: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } } },
    { "formats.medium.url": { $not: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } } },
    { "formats.large.url": { $not: { $regex: "lxp-strapi-content-test\\.s3\\.amazonaws\\.com" } } }
  ]
})




3️⃣ Actualizar masivamente las URLs antiguas al nuevo dominio

Este es un poco más largo porque debes reemplazar en url principal y en cada formats:

const oldBase = "https://ubits-pdn-s3-lxp-strapicontent.ubitslearning.com";
const newBase = "https://cdn.midominio.com/strapi-content-migrated";

db.upload_file.find({
  $or: [
    { url: { $regex: oldBase } },
    { "formats.thumbnail.url": { $regex: oldBase } },
    { "formats.small.url": { $regex: oldBase } },
    { "formats.medium.url": { $regex: oldBase } },
    { "formats.large.url": { $regex: oldBase } }
  ]
}).forEach(doc => {
  let updated = false;

  // url principal
  if (doc.url && doc.url.includes(oldBase)) {
    doc.url = doc.url.replace(oldBase, newBase);
    updated = true;
  }

  // formats.thumbnail
  if (doc.formats?.thumbnail?.url && doc.formats.thumbnail.url.includes(oldBase)) {
    doc.formats.thumbnail.url = doc.formats.thumbnail.url.replace(oldBase, newBase);
    updated = true;
  }

  // formats.small
  if (doc.formats?.small?.url && doc.formats.small.url.includes(oldBase)) {
    doc.formats.small.url = doc.formats.small.url.replace(oldBase, newBase);
    updated = true;
  }

  // formats.medium
  if (doc.formats?.medium?.url && doc.formats.medium.url.includes(oldBase)) {
    doc.formats.medium.url = doc.formats.medium.url.replace(oldBase, newBase);
    updated = true;
  }

  // formats.large
  if (doc.formats?.large?.url && doc.formats.large.url.includes(oldBase)) {
    doc.formats.large.url = doc.formats.large.url.replace(oldBase, newBase);
    updated = true;
  }

  if (updated) {
    db.upload_file.replaceOne({ _id: doc._id }, doc);
    print("Updated:", doc._id);
  }
});



use lxp_strapi_cms

db.strapi_administrator.insertOne({
  firstname: "infra-admin",
  lastname: "infra",
  email: "infrastructure@ubits.co",
  username: "infra-admin",
  password: "$2a$10$KTR0TZVtJv8whVkoPg9LYuSXHzjTQ4Ml39ziQplA6m3pj5uDQQ99i", // T3mp0r4l123%* produccion
  password: "$2a$10$LYgOg67NCetqfnKLXfuYtuw4v10vsWcrNFAeH0wruN7FvcCJpqbuq", // admin123* dev
  password: "$2a$10$P9bGylIbvQ518qMieM74huUI3Lhri/ibiM/pNQ7gynIgw5uydmLvy", // Infr4aDm1n%* test
  roles: [
    ObjectId('62b5e43002e501000efba444'),
    ObjectId('62b5e43002e501000efba445'),
    ObjectId('62b5e43002e501000efba443')
  ],
  isActive: true,
  blocked: false,
  confirmed: true,
  createdAt: new Date(),
  updatedAt: new Date()
});


db.strapi_administrator.find({}, { email: 1, username: 1, isActive: 1, blocked: 1 }).pretty()
db.strapi_users_roles.insertOne({
    role: ObjectId("62b5e43002e501000efba443"),   //id role
    user: ObjectId("68cdac570ad173de6dce5f47"),   //id usuario
    createdAt: new Date(),
    updatedAt: new Date()
  });
  
// para revisar los roles que hay
db.strapi_role.find().pretty()

db.strapi_users_roles.find({ user: ObjectId("6358a23d214d5c004677556d") }).pretty()
// Busca por email
db.strapi_administrator.findOne({ email: "jrios@ubtis.co" })

de jrios password
lxp_strapi_cms> db.strapi_administrator.findOne({ email: "jrios@ubits.co" })
{
  _id: ObjectId('6358a23d214d5c004677556d'),
  isActive: true,
  blocked: false,
  roles: [
    ObjectId('62b5e43002e501000efba444'),
    ObjectId('62b5e43002e501000efba445'),
    ObjectId('62b5e43002e501000efba443')
  ],
  username: null,
  registrationToken: null,
  firstname: 'Jose',
  lastname: 'Ríos Soto',
  email: 'jrios@ubits.co',
  __v: 0,
  password: '$2a$10$wUh15j5AQMFQDmx83ZS6g.bHEIpGnRGIf7a3VkOy64O5/ArHTWIx2',
  resetPasswordToken: null
}


db.strapi_administrator.insertOne({
    firstname: 'Jose',
    lastname: 'Ríos Soto',
    email: 'jrios@ubits.co',
    username: "qa_jrios",
    password: "$2a$10$wUh15j5AQMFQDmx83ZS6g.bHEIpGnRGIf7a3VkOy64O5/ArHTWIx2",
    isActive: true,
    blocked: false,
    confirmed: true,
    createdAt: new Date(),
    updatedAt: new Date()
  });

  actualizar campos de una coleccion un unico documenmto
  db.strapi_administrator.updateOne(
    { _id: ObjectId("68cd94899d726bca98ce5f47") },
    { $set: { username: "jrios@ubits.co", updatedAt: new Date() } }
  )

  
---------------
// Cambia este valor por el email o username del usuario que quieras consultar
const userQuery = "jrios@ubits.co";  

db.strapi_administrator.aggregate([
  {
    $match: {
      $or: [
        { email: userQuery },
        { username: userQuery }
      ]
    }
  },
  // Traemos los links usuario<->rol
  {
    $lookup: {
      from: "strapi_users_roles",
      localField: "_id",
      foreignField: "user",
      as: "userRoleLinks"
    }
  },
  { $unwind: { path: "$userRoleLinks", preserveNullAndEmptyArrays: true } },
  // Traemos la info del rol
  {
    $lookup: {
      from: "strapi_role",
      localField: "userRoleLinks.role",
      foreignField: "_id",
      as: "roleInfo"
    }
  },
  { $unwind: { path: "$roleInfo", preserveNullAndEmptyArrays: true } },
  // Reconstruimos el doc con un array de roles
  {
    $group: {
      _id: "$_id",
      email: { $first: "$email" },
      username: { $first: "$username" },
      firstname: { $first: "$firstname" },
      lastname: { $first: "$lastname" },
      isActive: { $first: "$isActive" },
      blocked: { $first: "$blocked" },
      confirmed: { $first: "$confirmed" },
      createdAt: { $first: "$createdAt" },
      updatedAt: { $first: "$updatedAt" },
      roles: { $push: { $ifNull: ["$roleInfo.name", null] } }
    }
  },
  // Limpiamos nulls en el array de roles
  {
    $project: {
      email: 1,
      username: 1,
      firstname: 1,
      lastname: 1,
      isActive: 1,
      blocked: 1,
      confirmed: 1,
      createdAt: 1,
      updatedAt: 1,
      roles: {
        $cond: {
          if: { $eq: [ { $size: {
            $filter: {
              input: "$roles",
              as: "r",
              cond: { $ne: ["$$r", null] }
            }
          } }, 0 ] },
          then: ["no tiene roles asociados"],
          else: {
            $filter: {
              input: "$roles",
              as: "r",
              cond: { $ne: ["$$r", null] }
            }
          }
        }
      }
    }
  }
]).pretty();
