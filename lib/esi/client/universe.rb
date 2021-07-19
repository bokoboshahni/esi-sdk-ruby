# frozen_string_literal: true

module ESI
  class Client
    # ESI universe operations.
    module Universe
      # Get all character ancestries.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_ancestries
      def get_universe_ancestries(params: {}, headers: {})
        get("/universe/ancestries/", headers: headers, params: params)
      end

      # Get information on an asteroid belt.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param asteroid_belt_id [Integer,String] asteroid_belt_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Asteroid belt not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_asteroid_belts_asteroid_belt_id
      def get_universe_asteroid_belt(asteroid_belt_id:, params: {}, headers: {})
        get("/universe/asteroid_belts/#{asteroid_belt_id}/", headers: headers, params: params)
      end
      alias get_universe_asteroid_belts_asteroid_belt_id get_universe_asteroid_belt

      # Get a list of bloodlines.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_bloodlines
      def get_universe_bloodlines(params: {}, headers: {})
        get("/universe/bloodlines/", headers: headers, params: params)
      end

      # Get a list of item categories.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_categories
      def get_universe_categories(params: {}, headers: {})
        get("/universe/categories/", headers: headers, params: params)
      end

      # Get information of an item category.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param category_id [Integer,String] An Eve item category ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Category not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_categories_category_id
      def get_universe_categories_category(category_id:, params: {}, headers: {})
        get("/universe/categories/#{category_id}/", headers: headers, params: params)
      end
      alias get_universe_categories_category_id get_universe_categories_category

      # Get information on a constellation.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param constellation_id [Integer,String] constellation_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Constellation not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_constellations_constellation_id
      def get_universe_constellation(constellation_id:, params: {}, headers: {})
        get("/universe/constellations/#{constellation_id}/", headers: headers, params: params)
      end
      alias get_universe_constellations_constellation_id get_universe_constellation

      # Get a list of constellations.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_constellations
      def get_universe_constellations(params: {}, headers: {})
        get("/universe/constellations/", headers: headers, params: params)
      end

      # Get a list of factions.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_factions
      def get_universe_factions(params: {}, headers: {})
        get("/universe/factions/", headers: headers, params: params)
      end

      # Get information on a graphic.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param graphic_id [Integer,String] graphic_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Graphic not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_graphics_graphic_id
      def get_universe_graphic(graphic_id:, params: {}, headers: {})
        get("/universe/graphics/#{graphic_id}/", headers: headers, params: params)
      end
      alias get_universe_graphics_graphic_id get_universe_graphic

      # Get a list of graphics.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_graphics
      def get_universe_graphics(params: {}, headers: {})
        get("/universe/graphics/", headers: headers, params: params)
      end

      # Get information on an item group.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param group_id [Integer,String] An Eve item group ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Group not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_groups_group_id
      def get_universe_group(group_id:, params: {}, headers: {})
        get("/universe/groups/#{group_id}/", headers: headers, params: params)
      end
      alias get_universe_groups_group_id get_universe_group

      # Get a list of item groups.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_groups
      def get_universe_groups(params: {}, headers: {})
        get("/universe/groups/", headers: headers, params: params)
      end

      # Get information on a moon.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param moon_id [Integer,String] moon_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Moon not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_moons_moon_id
      def get_universe_moon(moon_id:, params: {}, headers: {})
        get("/universe/moons/#{moon_id}/", headers: headers, params: params)
      end
      alias get_universe_moons_moon_id get_universe_moon

      # Get information on a planet.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param planet_id [Integer,String] planet_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Planet not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_planets_planet_id
      def get_universe_planet(planet_id:, params: {}, headers: {})
        get("/universe/planets/#{planet_id}/", headers: headers, params: params)
      end
      alias get_universe_planets_planet_id get_universe_planet

      # Get a list of character races.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_races
      def get_universe_races(params: {}, headers: {})
        get("/universe/races/", headers: headers, params: params)
      end

      # Get information on a region.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer,String] region_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Region not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_regions_region_id
      def get_universe_region(region_id:, params: {}, headers: {})
        get("/universe/regions/#{region_id}/", headers: headers, params: params)
      end
      alias get_universe_regions_region_id get_universe_region

      # Get a list of regions.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_regions
      def get_universe_regions(params: {}, headers: {})
        get("/universe/regions/", headers: headers, params: params)
      end

      # Get information on a star.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param star_id [Integer,String] star_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_stars_star_id
      def get_universe_star(star_id:, params: {}, headers: {})
        get("/universe/stars/#{star_id}/", headers: headers, params: params)
      end
      alias get_universe_stars_star_id get_universe_star

      # Get information on a stargate.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param stargate_id [Integer,String] stargate_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Stargate not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_stargates_stargate_id
      def get_universe_stargate(stargate_id:, params: {}, headers: {})
        get("/universe/stargates/#{stargate_id}/", headers: headers, params: params)
      end
      alias get_universe_stargates_stargate_id get_universe_stargate

      # Get information on a station.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param station_id [Integer,String] station_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Station not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_stations_station_id
      def get_universe_station(station_id:, params: {}, headers: {})
        get("/universe/stations/#{station_id}/", headers: headers, params: params)
      end
      alias get_universe_stations_station_id get_universe_station

      # Returns information on requested structure if you are on the ACL. Otherwise, returns "Forbidden" for all inputs.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-universe.read_structures.v1
      #
      # @esi_version v2
      #
      # @param structure_id [Integer,String] An Eve structure ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Structure not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_structures_structure_id
      def get_universe_structure(structure_id:, params: {}, headers: {})
        get("/universe/structures/#{structure_id}/", headers: headers, params: params)
      end
      alias get_universe_structures_structure_id get_universe_structure

      # List all public structures.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param filter [String] Only list public structures that have this service online
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_structures
      def get_universe_structures(filter:, params: {}, headers: {})
        query_string = URI.encode_www_form([["filter", filter]])
        get("/universe/structures/?#{query_string}", headers: headers, params: params)
      end

      # Get information on a solar system.
      #
      # @esi_version dev
      # @esi_version v4
      #
      # @param system_id [Integer,String] system_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Solar system not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_systems_system_id
      def get_universe_system(system_id:, params: {}, headers: {})
        get("/universe/systems/#{system_id}/", headers: headers, params: params)
      end
      alias get_universe_systems_system_id get_universe_system

      # Get the number of jumps in solar systems within the last hour ending at the timestamp of the Last-Modified header, excluding wormhole space. Only systems with jumps will be listed.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_system_jumps
      def get_universe_system_jumps(params: {}, headers: {})
        get("/universe/system_jumps/", headers: headers, params: params)
      end

      # Get the number of ship, pod and NPC kills per solar system within the last hour ending at the timestamp of the Last-Modified header, excluding wormhole space. Only systems with kills will be listed.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version v2
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_system_kills
      def get_universe_system_kills(params: {}, headers: {})
        get("/universe/system_kills/", headers: headers, params: params)
      end

      # Get a list of solar systems.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_systems
      def get_universe_systems(params: {}, headers: {})
        get("/universe/systems/", headers: headers, params: params)
      end

      # Get information on a type.
      #
      # @esi_version dev
      # @esi_version v3
      #
      # @param type_id [Integer,String] An Eve item type ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Type not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_types_type_id
      def get_universe_type(type_id:, params: {}, headers: {})
        get("/universe/types/#{type_id}/", headers: headers, params: params)
      end
      alias get_universe_types_type_id get_universe_type

      # Get a list of type ids.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/get_universe_types
      def get_universe_types(params: {}, headers: {})
        get("/universe/types/", headers: headers, params: params)
      end

      # Resolve a set of names to IDs in the following categories: agents, alliances, characters, constellations, corporations factions, inventory_types, regions, stations, and systems. Only exact matches will be returned. All names searched for are cached for 12 hours.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param names [Array] The names to resolve
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/post_universe_ids
      def post_universe_ids(names:, headers: {})
        post("/universe/ids/", headers: headers, payload: names)
      end

      # Resolve a set of IDs to names and categories. Supported ID's for resolving are: Characters, Corporations, Alliances, Stations, Solar Systems, Constellations, Regions, Types, Factions.
      #
      # @esi_version dev
      # @esi_version v3
      #
      # @param ids [Array] The ids to resolve
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Ensure all IDs are valid before resolving
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Universe/post_universe_names
      def post_universe_names(ids:, headers: {})
        post("/universe/names/", headers: headers, payload: ids)
      end
    end
  end
end
