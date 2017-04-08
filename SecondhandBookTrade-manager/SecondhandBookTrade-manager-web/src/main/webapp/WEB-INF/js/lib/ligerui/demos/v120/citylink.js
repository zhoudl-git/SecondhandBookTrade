function getCountryData()
{
    var data = [];
    $(CustomersData.Rows).each(function ()
    {
        if (!this.Country) return;
        if (!exist(this.Country, data))
        {
            data.push({
                Country: this.Country
            });
        }
    }); 
    return data;
    function exist(country, data)
    {
        for (var i = 0, l = data.length; i < l; i++)
        {
            if (data[i].Country.toString().trim() == country.toString().trim())
            {
                return true;
            }
        }
        return false;
    }
}

function getCityData(Country)
{
    var data = [];
    $(CustomersData.Rows).each(function ()
    {
        if (!this.City) return;
        if (this.Country == Country && !exist(this.City, data))
        {
            data.push(this);
        }
    });
    return data;
    function exist(city, data)
    {
        for (var i = 0, l = data.length; i < l; i++)
        {
            if (data[i].City.toString().trim() == city.toString().trim()) return true;
        }
        return false;
    }
}