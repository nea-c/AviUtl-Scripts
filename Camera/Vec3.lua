
local mt={}
local function setmt(t)
    return setmetatable(t,mt)
end
mt.__type="Vec3"
local Vec3=setmetatable({},{
    __call=function(o,...)
        local t={...}
        if(type(t[1])=="table")then
            return setmt(t[1])
        end
        return setmt{t[1] or 0,t[2] or 0,t[3] or 0}
    end
})

local function isVec3(v)
    local mt=getmetatable(v)
    if(mt==nil)then
        return false
    else
        return mt.__type=="Vec3"
    end
end

local PropertyList={}
local function Property(name,getter,setter)
    PropertyList[name]={getter,setter}
end
local function PropertyEasy(name,idx)
    PropertyList[name]={
        function(o)
            return o[idx]
        end,
        function(o,v)
            o[idx]=v
        end
    }
end

--Ç±Ç±Ç‹Ç≈ÉeÉìÉvÉå

PropertyEasy("x",1)
PropertyEasy("y",2)
PropertyEasy("z",3)

function Vec3.cross(a,b)
    return setmt{
        a[2]*b[3]-a[3]*b[2],
        a[3]*b[1]-a[1]*b[3],
        a[1]*b[2]-a[2]*b[1]
    }
end

function Vec3.dot(a,b)
    return a[1]*b[1]+a[2]*b[2]+a[3]*b[3]
end

function Vec3.norm(a)
    local l_=1/math.sqrt(a[1]*a[1]+a[2]*a[2]+a[3]*a[3])
    return setmt{a[1]*l_,a[2]*l_,a[3]*l_}
end

function Vec3.length(a)
    return math.sqrt(a[1]*a[1]+a[2]*a[2]+a[3]*a[3])
end

function Vec3.unpack(a)
    return a[1],a[2],a[3]
end

function Vec3.each(a,f,...)
    local r=setmt{0,0,0}
    for i=1,3 do
        r[i]=f(a[i],...)
        debug_print(r[i])
    end
    return r
end

mt.__index=function(o,k)
    for n,t in pairs(PropertyList) do
        if(k==n)then
            if(t[1]~=nil)then
                return t[1](o)
            else
                error(n.." doesn't have getter.")
            end
        end
    end
    if(Vec3[k]~=nil)then
        return Vec3[k]
    end
    return nil
end

mt.__newindex=function(o,k,v)
    for n,t in pairs(PropertyList) do
        if(k==n)then
            if(t[2]~=nil)then
                t[2](o,v)
                return
            else
                error(n.." doesn't have setter.")
            end
        end
    end
end

mt.__add=function(a,b)
    return setmt{a[1]+b[1],a[2]+b[2],a[3]+b[3]}
end

mt.__sub=function(a,b)
    return setmt{a[1]-b[1],a[2]-b[2],a[3]-b[3]}
end

mt.__mul=function(a,b)
    if(type(a)=="number")then
        return setmt{b[1]*a,b[2]*a,b[3]*a}
    elseif(type(b)=="number")then
        return setmt{a[1]*b,a[2]*b,a[3]*b}
    end
    return setmt{
        a[2]*b[3]-a[3]*b[2],
        a[3]*b[1]-a[1]*b[3],
        a[1]*b[2]-a[2]*b[1]
    }
end

mt.__div=function(a,b)
    if(type(b)=="number")then
        return setmt{a[1]/b,a[2]/b,a[3]/b}
    end
    error("Vec3Ç…ÇÊÇÈèúéZÇÕíËã`Ç≥ÇÍÇ»Ç¢")
end

mt.__unm=function(a)
    return setmt{-a[1],-a[2],-a[3]}
end

mt.__tostring=function(a)
    return string.format("{ %f, %f, %f }",a[1],a[2],a[3])
end

debug_print("[Vec3] Vec3 Module loading completed!")
return Vec3