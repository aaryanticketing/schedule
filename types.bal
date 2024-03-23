type WeatherRecord record {
    string dt_txt;
    MainData main;
    Weather[] weather;
    Clouds clouds;
    Wind wind;
};

type MainData record {
    float temp;
    int humidity;
};

type Weather record {
    string main;
    string description;
};

type Clouds record {|
    int all;
|};

type Wind record {|
    float speed;
    int deg;
    float gust;
|};

type WeatherRecordList record {
    WeatherRecord[] list;
};

type Movie record {|
    string id;
    string movie_name;
    string description_text;
    string image;
    string start_date;
    string end_date;
|};

type LocationTime record {|
    string location_id;
    string time_id;
    string times;
    string loc_name;
    string address;
    string seats;
|};

type Show record {|
    string id;
    string movie_id;
    string date_selected;
    string time_id;
    string seats_left;
    string location_id;
|};